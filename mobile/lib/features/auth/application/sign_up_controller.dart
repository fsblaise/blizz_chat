import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

part 'sign_up_controller.g.dart';

final I10n _i10n = locator<I10n>();

@riverpod
class SignUpController extends _$SignUpController {
  @override
  SignUpForm build() {
    return SignUpForm(name: '', email: '', password: '', confirmPassword: '');
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  Future<FbUser?> signUp() async {
    if (!state.isValid) {
      throw Exception(_i10n.invalidForm);
    }
    final user = await ref.read(authRepositoryProvider).signUp(
          signUpForm: state,
        );
    return user;
  }
}
