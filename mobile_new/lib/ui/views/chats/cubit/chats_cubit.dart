import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_states.dart';
part 'chats_cubit.freezed.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(const ChatsState.initial());

  Future<void> fetchChats() async {
    try {
      emit(const ChatsState.fetching());
      final chats = await ChatsRepository.fetchChats();
      emit(ChatsState.fetched(chats: chats));
    } catch (e) {
      print(e);
      emit(const ChatsState.error(message: 'Failed to fetch chats'));
    }
  }

  Chat? getChat(String chatId) {
    final currentState = state;
    if (currentState is ChatsFetched) {
      return currentState.chats.firstWhere((chat) => chat.id == chatId);
    }
    return null;
  }

  // dev function
  void clear() {
    emit(const ChatsState.initial());
  }

  Future<void> createChat(
    List<CreateParticipantDto> participants,
    BuildContext context,
  ) async {
    final currentState = state;
    try {
      final currentChats = <Chat>[];
      if (currentState is ChatsFetched) {
        currentChats.addAll(currentState.chats);
      }
      emit(const ChatsState.fetching());

      final authCubit = BlocProvider.of<AuthCubit>(context);
      final currentUser = authCubit.getCurrentUser();

      if (currentUser == null) {
        throw Exception('Current user not found');
      }

      final chat = await ChatsRepository.createChat(
        CreateChatDto(
          participants: [
            CreateParticipantDto(
              fullName: currentUser.fullName,
              email: currentUser.email,
            ),
            ...participants,
          ],
        ),
      );
      // fetch updated chat list
      // await fetchChats();
      currentChats.add(chat);
      emit(ChatsState.fetched(chats: currentChats));
    } catch (e) {
      print(e);
      // emit(const ChatsState.error(message: 'Failed to create chat'));
      emit(currentState);
    }
  }

  Future<void> leaveChat(Chat chat) async {
    final currentState = state;
    try {
      emit(const ChatsState.fetching());

      final chats = await ChatsRepository.leaveChat(chat);

      emit(ChatsState.fetched(chats: chats));
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }

  Future<void> renameChat(Chat chat) async {
    final currentState = state;
    try {
      emit(const ChatsState.fetching());

      final chats = await ChatsRepository.renameChat(chat);

      emit(ChatsState.fetched(chats: chats));
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }

  Future<void> updateChatStatus(UserStatusDto status) async {
    final currentState = state;
    try {
      if (currentState is ChatsFetched) {
        emit(const ChatsState.fetching());

        final updatedChats = currentState.chats.map((chat) {
          var offlineParticipants = 0;
          final updatedParticipants = chat.participants.map((participant) {
            if (participant.email == status.userEmail) {
              if (status.status == 'offline') {
                offlineParticipants++;
              }
              return participant.copyWith(isOnline: status.status == 'online');
            } else {
              if (participant.isOnline == false) {
                offlineParticipants++;
              }
              return participant;
            }
          }).toList();
          return chat.copyWith(
            participants: updatedParticipants,
            isChatOnline: !(offlineParticipants == updatedParticipants.length),
          );
        }).toList();

        emit(ChatsState.fetched(chats: updatedChats));
      }
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }
}
