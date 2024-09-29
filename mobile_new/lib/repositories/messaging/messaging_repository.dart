part of '../repositories.dart';

// websocket response handling and database save calls
// ignore: non_constant_identifier_names
String WS_URL = 'ws://${dotenv.env['API_URL']}:3000';

class MessagingRepository {
  MessagingRepository();

  IO.Socket? _socket = null;

  final DatabaseService service = getIt.get<DatabaseService>();
  final LibsignalService libsignalService = getIt.get<LibsignalService>();

  /// Websocket methods

  void connect(String token) {
    print(_socket);
    cleanUp();
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
        cleanUp();
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
      final decryptedMessage = await libsignalService.decryptMessage(
          tempMessage.from, encryptedMessage, tempMessage.messageType);
      final message = tempMessage.copyWith(message: decryptedMessage);
      print('Received message: $message');
      onMessage(message);
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
    }
  }

  Future<void> sendDistributionKey(
      ShareDistributionKeyDto shareDistributionKeyDto) async {
    print('Sending distribution key');
    _socket?.emit('createDistributionKey', shareDistributionKeyDto.toJson());
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
