import 'package:blizz_chat/models/messaging/message_dtos.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messaging_states.dart';
part 'messaging_cubit.freezed.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit(
    this.messagingRepository,
    this.chatsCubit,
    this.usersCubit,
  ) : super(const MessagingInitial());
  final MessagingRepository messagingRepository;
  final ChatsCubit chatsCubit;
  final UsersCubit usersCubit;
  bool _listenersActive = false;

  void connect(String token) {
    print("run?");
    messagingRepository.connect(token);
    _setupListeners();
  }

  void disconnect() {
    messagingRepository.disconnect();
  }

  // The Message that we send has an array of recipients,
  // While the Message we save is joined string of recipients
  // Locally we only need the to field, to determine if the message is for us
  Future<void> sendMessage(MessageDto message) async {
    if (state is MessagingFetched) {
      final currentState = state as MessagingFetched;

      messagingRepository.sendMessage(message);
      final newMessage = convertDtoToMessage(message);
      await messagingRepository.saveMessage(newMessage);

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

      await messagingRepository.deleteMessage(messageId);

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

  Future<void> fetchMessages(String chatId) async {
    try {
      final messages = await messagingRepository.fetchMessages(chatId);
      emit(MessagingFetched(messages: sortMessages(messages), chatId: chatId));
    } catch (e) {
      emit(MessagingError(message: e.toString()));
    }
  }

  void _setupListeners() {
    if (!_listenersActive) {
      _listenForMessages();
      _listenForStatus();
      _listenersActive = true;
    }
  }

  void _listenForMessages() {
    messagingRepository.listenForMessages((message) {
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
      messagingRepository.saveMessage(message);
    });
  }

  void _listenForStatus() {
    messagingRepository.listenForStatus((UserStatusDto? dto) {
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
