import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    checkLoggedInUser();
  }

  Future<void> checkLoggedInUser() async {
    final authData = await AuthRepository.getLoggedInUser();
    emit(
      authData != null
          ? AuthState.authenticated(token: authData.token, user: authData.user)
          : const AuthState.unauthenticated(),
    );
  }

  UserProfile? getCurrentUser() {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).user;
    }
    return null;
  }

  String? getToken() {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).token;
    }
    return null;
  }

  Future<void> signUp(String email, String password, String fullName) async {
    try {
      final authResponse = await AuthRepository.signUp(
        SignUpDto(
          email: email,
          password: password,
          fullName: fullName,
        ),
      );
      emit(
        AuthState.authenticated(
          token: authResponse.token,
          user: authResponse.user,
        ),
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final authResponse = await AuthRepository.signIn(
        SignInDto(
          email: email,
          password: password,
        ),
      );
      emit(
        AuthState.authenticated(
          token: authResponse.token,
          user: authResponse.user,
        ),
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> signOut() async {
    await AuthRepository.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> addContact(String email, String fullName) async {
    final currentState = state as AuthAuthenticated;
    try {
      final userProfile = await UsersRepository.addUser(email, fullName);
      emit(
        AuthState.authenticated(
          token: currentState.token,
          user: userProfile,
        ),
      );
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }

  Future<void> removeContact(Contact contact) async {
    final currentState = state as AuthAuthenticated;
    try {
      final userProfile = await UsersRepository.removeUser(contact.email);
      emit(
        AuthState.authenticated(
          token: currentState.token,
          user: userProfile,
        ),
      );
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }

  Future<void> renameContact(Contact contact) async {
    final currentState = state as AuthAuthenticated;
    try {
      final userProfile = await UsersRepository.renameContact(contact);
      emit(
        AuthState.authenticated(
          token: currentState.token,
          user: userProfile,
        ),
      );
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }
}
