import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form.freezed.dart';

@freezed
class SignInForm with _$SignInForm {
  const SignInForm._();

  factory SignInForm({
    required String email,
    required String password,
  }) = _SignInForm;

  String? get emailErrorText {
    if (email.isEmpty) {
      return 'Email is missing';
    }
    return null;
  }

  String? get passwordErrorText {
    if (password.isEmpty) {
      return 'Password is missing';
    }
    return null;
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
