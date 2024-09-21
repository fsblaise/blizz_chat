import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_states.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState.initial());

  Future<void> fetchContacts() async {
    try {
      final currentState = state;
      var currentUsers = <User>[];
      if (currentState is UsersFetched) {
        currentUsers = currentState.users;
      }

      emit(const UsersState.fetching());

      final contacts = await UsersRepository.fetchContacts();

      emit(UsersState.fetched(users: currentUsers, contacts: contacts));
    } catch (e) {
      emit(const UsersState.error(message: 'Failed to fetch contacts'));
    }
  }

  Future<void> search({
    String? email,
    String? fullName,
  }) async {
    try {
      final currentState = state;
      var currentContacts = <User>[];
      if (currentState is UsersFetched) {
        currentContacts = currentState.contacts;
      }

      emit(const UsersState.fetching());

      final users = await UsersRepository.search(
        email: email,
        fullName: fullName,
      );

      emit(UsersState.fetched(users: users, contacts: currentContacts));
    } catch (e) {
      print(e);
      emit(const UsersState.error(message: 'Failed to fetch users'));
    }
  }

  void clear() {
    final currentState = state;
    var currentContacts = <User>[];
    if (currentState is UsersFetched) {
      currentContacts = currentState.contacts;
    }
    if (state is UsersFetched) {
      emit(UsersState.fetched(users: [], contacts: currentContacts));
    } else {
      emit(const UsersState.initial());
    }
  }

  Future<void> updateUserStatus(UserStatusDto status) async {
    final currentState = state;
    try {
      if (currentState is UsersFetched) {
        emit(const UsersState.fetching());

        final updatedContacts = currentState.contacts.map((contact) {
          if (contact.email == status.userEmail) {
            return contact.copyWith(isOnline: status.status == 'online');
          } else {
            return contact;
          }
        }).toList();

        emit(
          UsersState.fetched(
            users: currentState.users,
            contacts: updatedContacts,
          ),
        );
      }
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }
}
