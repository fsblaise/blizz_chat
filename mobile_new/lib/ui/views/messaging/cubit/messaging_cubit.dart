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
        final updatedMessages = List<Message>.from(currentState.messages)
          ..add(message);
        emit(MessagingFetched(messages: updatedMessages));
      }
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
}
