import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form.freezed.dart';

final I10n _i10n = locator<I10n>();

@freezed
class SignInForm with _$SignInForm {
  const SignInForm._();

  factory SignInForm({
    required String email,
    required String password,
  }) = _SignInForm;

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

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
