import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/resources/services/preferences/shared_preferences/session_manager.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    hello(); // asd
    checkLoggedInUser();
  }

  Future<bool> hello() async {
    try {
      final response = await getIt.get<ConnectionService>().hello();
      if (response) {
        print('hello');
        return true;
      } else {
        // api url is not available
        getIt.get<SessionManager>().removeActiveSession();
        emit(const AuthState.unauthenticated());
        return false;
      }
    } catch (e) {
      // api url is not available
      getIt.get<SessionManager>().removeActiveSession();
      emit(
        const AuthState.error(
          message:
              'Server is not available. Try a different user/workspace or try again later.',
        ),
      );
      emit(const AuthState.unauthenticated());
      return false;
    }
  }

  Future<void> checkLoggedInUser() async {
    try {
      final authData = await AuthRepository.getLoggedInUser();
      final apiUrl = CompaniesRepository.getApiUrl();
      emit(
        authData != null
            ? AuthState.authenticated(
                userSession: UserSession(
                apiUrl: apiUrl,
                token: authData.token,
                user: authData.user,
              ))
            : const AuthState.unauthenticated(),
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  UserProfile? getCurrentUser() {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).userSession.user;
    }
    return null;
  }

  String? getToken() {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).userSession.token;
    }
    return null;
  }

  String? getApiUrl() {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).userSession.apiUrl;
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
          userSession: UserSession(
            token: authResponse.token,
            user: authResponse.user,
            apiUrl: CompaniesRepository.getApiUrl(),
          ),
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
          userSession: UserSession(
            token: authResponse.token,
            user: authResponse.user,
            apiUrl: CompaniesRepository.getApiUrl(),
          ),
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
          userSession: UserSession(
            token: currentState.userSession.token,
            user: userProfile,
            apiUrl: currentState.userSession.apiUrl,
          ),
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
          userSession: UserSession(
            token: currentState.userSession.token,
            user: userProfile,
            apiUrl: currentState.userSession.apiUrl,
          ),
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
          userSession: UserSession(
            token: currentState.userSession.token,
            user: userProfile,
            apiUrl: currentState.userSession.apiUrl,
          ),
        ),
      );
    } catch (e) {
      print(e);
      emit(currentState);
    }
  }

  Future<void> setCurrentUser(UserPrefsSession session) async {
    emit(
      AuthState.authenticated(
        userSession: UserSession(
          token: session.token!,
          user: session.user!,
          apiUrl: session.apiUrl,
        ),
      ),
    );
  }

  Future<void> clearCurrentUser() async {
    emit(const AuthState.unauthenticated());
  }
}
