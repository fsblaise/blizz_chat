import 'package:blizz_chat/models/messaging/message_dtos.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

part 'messaging_states.dart';
part 'messaging_cubit.freezed.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit(
    this.chatsCubit,
    this.usersCubit,
  ) : super(const MessagingInitial());
  late MessagingRepository? messagingRepository;
  final ChatsCubit chatsCubit;
  final UsersCubit usersCubit;
  bool _listenersActive = false;

  Future<void> connect(String token) async {
    messagingRepository = MessagingRepository();
    print("run?");
    messagingRepository!.connect(token);

    // create and send public key to the server
    final publicKey = messagingRepository!.libsignalService.getPublicKeys();
    await KeysRepository.sharePublicKeys(publicKey);

    _setupListeners();
  }

  void disconnect() {
    messagingRepository!.disconnect();
    messagingRepository = null;
    _listenersActive = false;
  }

  // The Message that we send has an array of recipients,
  // While the Message we save is joined string of recipients
  // Locally we only need the to field, to determine if the message is for us
  void sendMessage(MessageDto message) {
    if (state is MessagingFetched) {
      final currentState = state as MessagingFetched;

      // removed awaits, because we don't use their values
      messagingRepository!.sendMessage(message);
      final newMessage = convertDtoToMessage(message);
      messagingRepository!.saveMessage(newMessage);

      if (newMessage.chatId == currentState.chatId) {
        final updatedMessages = List<Message>.from(currentState.messages)
          ..add(newMessage);
        emit(
          MessagingFetched(
            messages: sortMessages(updatedMessages),
            chatId: currentState.chatId,
          ),
        );
      }
    }
  }

  Future<void> deleteMessage(String messageId) async {
    if (state is MessagingFetched) {
      final currentState = state as MessagingFetched;

      await messagingRepository!.deleteMessage(messageId);

      final updatedMessages = currentState.messages
          .where((message) => message.id != messageId)
          .toList();

      emit(
        MessagingFetched(
          messages: sortMessages(updatedMessages),
          chatId: currentState.chatId,
        ),
      );
    }
  }

  // This could be the init function of a chat/messaging
  // Maybe put the key fetching and session creation call here
  Future<void> fetchMessages(Chat? chat, String? userEmail) async {
    try {
      final messages = await messagingRepository!.fetchMessages(chat!.id);

      await messagingRepository!.createGroupSession(chat, userEmail!);

      emit(MessagingFetched(messages: sortMessages(messages), chatId: chat.id));
    } catch (e, stackTrace) {
      emit(MessagingFetched(messages: [], chatId: chat?.id ?? ''));
      print(e);
      print(stackTrace);
    }
  }

  void _setupListeners() {
    if (!_listenersActive) {
      _listenForMessages();
      _listenForStatus();
      _listenForDistributionKeys();
      _listenersActive = true;
    }
  }

  void _listenForDistributionKeys() {
    messagingRepository!.listenForDistributionKeys((keyDto) {
      print(keyDto);
    });
  }

  void _listenForMessages() {
    messagingRepository!.listenForMessages((message) {
      // Handle the received message
      // For example, you can add the message to the current state
      if (state is MessagingFetched) {
        final currentState = state as MessagingFetched;
        if (message.chatId == currentState.chatId) {
          final updatedMessages = List<Message>.from(currentState.messages)
            ..add(message);
          emit(
            MessagingFetched(
              messages: sortMessages(updatedMessages),
              chatId: currentState.chatId,
            ),
          );
        }
      }
      messagingRepository!.saveMessage(message);
    });
  }

  void _listenForStatus() {
    messagingRepository!.listenForStatus((UserStatusDto? dto) {
      if (dto != null) {
        print('User updated: ${dto.userEmail}');
        print('User status: ${dto.status}');
        chatsCubit.updateChatStatus(dto);
        usersCubit.updateUserStatus(dto);
      }
    });
  }

  /// Utils

  Message convertDtoToMessage(MessageDto dto) {
    return Message(
      id: dto.id,
      message: dto.message,
      messageType: dto.messageType,
      from: dto.from,
      to: dto.to.join(','),
      chatId: dto.chatId,
      timestamp: dto.timestamp,
    );
  }

  List<Message> sortMessages(List<Message> messages) {
    return messages
      ..sort(
        (a, b) =>
            DateTime.parse(b.timestamp).compareTo(DateTime.parse(a.timestamp)),
      );
  }
}
