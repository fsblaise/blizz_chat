import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_states.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState.initial());

  Future<void> fetchUsers() async {
    try {
      emit(const UsersState.fetching());
      final users = await UsersRepository.fetchUsers();
      emit(UsersState.fetched(users: users));
    } catch (e) {
      emit(const UsersState.error(message: 'Failed to fetch users'));
    }
  }

  Future<void> search({
    String? email,
    String? fullName,
  }) async {
    try {
      emit(const UsersState.fetching());
      final users = await UsersRepository.search(
        email: email,
        fullName: fullName,
      );
      emit(UsersState.fetched(users: users));
    } catch (e) {
      print(e);
      emit(const UsersState.error(message: 'Failed to fetch users'));
    }
  }

  void clear() {
    emit(const UsersState.initial());
  }
}
