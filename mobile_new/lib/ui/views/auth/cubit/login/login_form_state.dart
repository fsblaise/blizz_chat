part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required String email,
    required String password,
    required bool isValid,
    String? emailError,
    String? passwordError,
  }) = _LoginFormState;

  factory LoginFormState.initial() => const LoginFormState(
        email: '',
        password: '',
        isValid: false,
      );
}
