part of 'register_form_cubit.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required String email,
    required String password,
    required String rePassword,
    required String fullName,
    required bool isStepOneValid,
    required bool isValid,
    String? emailError,
    String? passwordError,
    String? rePasswordError,
    String? fullNameError,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => const RegisterFormState(
        email: '',
        password: '',
        rePassword: '',
        fullName: '',
        isStepOneValid: false,
        isValid: false,
      );
}
