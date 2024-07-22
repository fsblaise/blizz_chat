import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

part 'sign_in_controller.g.dart';

final I10n _i10n = locator<I10n>();

@riverpod
class SignInController extends _$SignInController {
  @override
  SignInForm build() {
    return SignInForm(email: '', password: '');
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<User> signIn() async {
    if (!state.isValid) {
      throw Exception(_i10n.invalidForm);
    }
    // TODO: move this signup to the authcontroller and call the controller here
    final user = await ref.read(authRepositoryProvider).signIn(
          signInForm: state,
        );
    return user;
  }
}
