import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messaging_states.dart';
part 'messaging_cubit.freezed.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit(this.messagingRepository) : super(const MessagingInitial());
  final MessagingRepository messagingRepository;

  void connect(String token) {
    print("run?");
    messagingRepository.connect(token);
    _listenForMessages();
    _listenForStatus();
  }

  void disconnect() {
    messagingRepository.disconnect();
  }

  void sendMessage(Message message) {
    messagingRepository.sendMessage(message);
  }

  Future<void> fetchMessages(String chatId) async {
    try {
      final messages = await messagingRepository.fetchMessages(chatId);
      emit(MessagingFetched(messages: messages));
    } catch (e) {
      emit(MessagingError(message: e.toString()));
    }
  }

  void _listenForMessages() {
    messagingRepository.listenForMessages((message) {
      // Handle the received message
      // For example, you can add the message to the current state
      if (state is MessagingFetched) {
        final currentState = state as MessagingFetched;
        final updatedMessages = List<Message>.from(currentState.messages)
          ..add(message);
        emit(MessagingFetched(messages: updatedMessages));
      }
    });
  }

  void _listenForStatus() {
    messagingRepository.listenForStatus((UserStatusDto? dto) {
      if (dto != null) {
        print('User updated: ${dto.userId}');
        print('User status: ${dto.status}');
      }
    });
  }
}
