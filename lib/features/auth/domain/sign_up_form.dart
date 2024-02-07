import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.freezed.dart';

final I10n _i10n = locator<I10n>();

@freezed
class SignUpForm with _$SignUpForm {
  const SignUpForm._();

  factory SignUpForm({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _SignUpForm;

  String? get nameErrorText {
    if (name.isEmpty) {
      return _i10n.nameMissing;
    }
    return null;
  }

  String? get emailErrorText {
    if (email.isEmpty) {
      return _i10n.emailMissing;
    }
    return null;
  }

  String? get passwordErrorText {
    if (password.isEmpty) {
      return _i10n.passwordMissing;
    }
    return null;
  }

  String? get confirmPasswordErrorText {
    if (confirmPassword.isEmpty) {
      return _i10n.confirmPasswordMissing;
    }
    if (password != confirmPassword) {
      return _i10n.passwordsDoNotMatch;
    }
    return null;
  }

  bool get isAuthStepValid =>
      email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && password == confirmPassword;

  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;
}
