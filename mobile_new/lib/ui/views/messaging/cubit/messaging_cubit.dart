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
  }

  void sendMessage(Message message) {
    messagingRepository.sendMessage(message);
  }

  void fetchMessages(String chatId) {}
}
