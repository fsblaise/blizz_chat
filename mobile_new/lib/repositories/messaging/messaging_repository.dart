part of '../repositories.dart';

class MessagingRepository {
  MessagingRepository();

  IO.Socket? _socket = null;

  final DatabaseService service = getIt.get<DatabaseService>();
  final LibsignalService libsignalService = getIt.get<LibsignalService>();

  /// Websocket methods

  void connect(String token) {
    print(_socket);
    cleanUp();

    final apiUrl = CompaniesRepository.getApiUrl();
    final split = apiUrl.split('://');
    final protocol = split[0] == 'https' ? 'wss' : 'ws';
    final WS_URL = '$protocol://${split[1]}';

    // print(Uri.parse(WS_URL).toString());
    try {
      _socket = IO.io(
          WS_URL,
          IO.OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
              .enableForceNewConnection()
              .setTimeout(5000)
              .setReconnectionDelay(10000)
              .enableReconnection()
              .setExtraHeaders(
                <String, dynamic>{'Authorization': 'Bearer $token'},
              )
              .build());

      _socket?.connect();

      _socket?.on('connect', (_) {
        print('Connected to WebSocket');
      });

      _socket?.on('disconnect', (_) {
        print('Disconnected from WebSocket');
      });
    } catch (e) {
      print('Error connecting to WebSocket: $e');
    }
  }

  /// Listen for messages from the server
  /// This method only formats the incoming data
  /// The callback does the rest
  void listenForMessages(void Function(Message) onMessage) {
    _socket?.on('receiveMessage', (data) async {
      print(data);
      final tempMessage = Message.fromJson(data as Map<String, dynamic>);
      // saveMessage(message); // Here we should not use this
      // We should pass the onMessage from the cubit
      // Inside the callback we should call the saveMessage function
      final encryptedMessage = base64Decode(tempMessage.message);

      if (tempMessage.messageType == CiphertextMessage.senderKeyType) {
        final decryptedMessage = await libsignalService.decryptGroupMessage(
          tempMessage.chatId,
          tempMessage.from,
          encryptedMessage,
        );
        final message = tempMessage.copyWith(message: decryptedMessage);
        print('Received message: $message');
        onMessage(message);
        return;
      } else {
        final decryptedMessage = await libsignalService.decryptMessage(
          tempMessage.from,
          encryptedMessage,
          tempMessage.messageType,
        );
        final message = tempMessage.copyWith(message: decryptedMessage);
        print('Received message: $message');
        onMessage(message);
      }
    });
  }

  void listenForDistributionKeys(
      void Function(DistributionKeyDto) onDistributionKey) {
    print('listening for distro keys');
    _socket?.on('receiveDistributionKey', (data) async {
      try {
        print('received distro key');
        print(data);
        print(data.runtimeType);
        final distributionKeyDto =
            DistributionKeyDto.fromJson(data as Map<String, dynamic>);
        print(distributionKeyDto);
        // Fetch chat
        final chat =
            await ChatsRepository.fetchChat(distributionKeyDto.groupId);
        await createGroupSession(chat, distributionKeyDto.to);
        await libsignalService.registerGroupSession(
          distributionKeyDto.groupId,
          distributionKeyDto.senderEmail,
          distributionKeyDto.key,
          distributionKeyDto.messageType,
        );
        onDistributionKey(distributionKeyDto);
      } catch (e, stackTrace) {
        print('Error parsing distributionKey data: $e');
        print(stackTrace);
      }
    });
  }

  void listenForStatus(void Function(UserStatusDto?) onStatus) {
    _socket?.on('userStatus', (data) {
      try {
        print(data);
        final dataMap = data as Map<String, dynamic>;
        final dto = UserStatusDto.fromJson(dataMap);
        onStatus(dto);
      } catch (e) {
        print('Error parsing userStatus data: $e');
        onStatus(null);
      }
    });
  }

  Future<void> sendMessage(MessageDto message) async {
    if (message.to.length == 1) {
      // lets pretend group chats do not exist
      final encryptedMessage = await libsignalService.encryptMessage(
        message.to[0],
        message.message,
      );

      final messageType = encryptedMessage.getType();
      final serializedMessage = base64Encode(encryptedMessage.serialize());

      final messageToSend = message.copyWith(
        message: serializedMessage,
        messageType: messageType,
      );
      print('messageToSend: ${messageToSend.toJson()}');
      _socket?.emit('createMessage', messageToSend.toJson());
    } else {
      final encryptedMessage = await libsignalService.encryptGroupMessage(
        message.chatId,
        message.from,
        message.message,
      );

      final serializedMessage = base64Encode(encryptedMessage!);

      final messageToSend = message.copyWith(
        message: serializedMessage,
        messageType: CiphertextMessage.senderKeyType,
      );

      print('messageToSend: ${messageToSend.toJson()}');
      _socket?.emit('createMessage', messageToSend.toJson());
    }
  }

  Future<void> sendDistributionKey(
      ShareDistributionKeyDto shareDistributionKeyDto) async {
    print('Sending distribution key');
    _socket?.emit('createDistributionKey', shareDistributionKeyDto.toJson());
  }

  Future<void> createGroupSession(Chat chat, String userEmail) async {
    for (final participant in chat.participants) {
      if (participant.email != userEmail) {
        final remoteUserEmail = participant.email;
        final remoteAddress = SignalProtocolAddress(remoteUserEmail, 1);

        print('Checking if session exists for $remoteUserEmail');

        final sessionExists =
            await libsignalService.sessionStore.containsSession(remoteAddress);

        print('Session exists: $sessionExists');

        if (!sessionExists) {
          final keyDtos =
              await KeysRepository.fetchPublicKeys([remoteUserEmail]);

          if (keyDtos.isEmpty) {
            print('No keys found for $remoteUserEmail');
            continue;
          }
          // print('Received keys: ${keyDtos.first}');

          await libsignalService.createSession(
              remoteUserEmail, KeysDto.toLibsignal(keyDtos.first));
        }
      }
    }

    if (chat.participants.length > 2) {
      final groupId = chat.id;
      var participantSessionExists = false;

      // We iterate through the participants (excl. user)
      // And check if a group session exists with the participant as sender
      final participantEmails = chat.participants
          .where((participant) => participant.email != userEmail)
          .map((participant) => participant.email)
          .toList();
      for (final email in participantEmails) {
        print('Checking if group exist with the sender being: $email');

        final exists =
            await libsignalService.groupSessionExists(groupId, email);
        if (exists) {
          participantSessionExists = true;
          break;
        }
      }

      print('Participant session exists: $participantSessionExists');

      if (!participantSessionExists) {
        // If no group session exists for a participant, we check if the user has one
        final exists =
            await libsignalService.groupSessionExists(groupId, userEmail!);

        if (!exists) {
          print('Group session exists: $exists');
          print(
              'Creating group session, groupId: $groupId, userEmail: $userEmail');
          await libsignalService.createGroupSession(
            groupId,
            userEmail,
            (groupId, distributionMessage) async {
              final recipients = chat.participants
                  .where((participant) => participant.email != userEmail)
                  .map((participant) => participant.email)
                  .toList();

              if (recipients.isNotEmpty) {
                final messageType = distributionMessage.getType();
                print('MessageType: $messageType');
                print(
                  'SerializedMessage: ${distributionMessage.serialize()}',
                );
                // send message to server
                final shareDistributionKeyDto = ShareDistributionKeyDto(
                  to: recipients,
                  groupId: groupId,
                  senderEmail: userEmail,
                  key: distributionMessage.serialize(),
                  messageType: messageType,
                );
                // no need for await, since we don't rely on the response
                await sendDistributionKey(shareDistributionKeyDto);
              }
            },
          );
        } else {
          print('Group session exists: $exists');
        }
      }
    }
  }

  void disconnect() {
    _socket?.dispose();
    _socket = null;
  }

  void cleanUp() {
    _socket?.dispose();
    _socket = null;
  }

  /// Database methods

  Future<void> saveMessage(Message message) async {
    await service.saveMessage(message);
  }

  Future<List<Message>> fetchMessages(String chatId) async {
    return service.fetchMessages(chatId);
  }

  Future<void> deleteMessage(String messageId) async {
    await service.deleteMessage(messageId);
  }

  Future<void> createSession(
      String remoteUserId, PreKeyBundle preKeyBundle) async {
    await libsignalService.createSession(remoteUserId, preKeyBundle);
  }
}
