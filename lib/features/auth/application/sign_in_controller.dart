import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

part 'sign_in_controller.g.dart';

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

  Future<FbUser?> signIn() async {
    if (!state.isValid) {
      throw Exception('Invalid form');
    }
    final user = await ref.read(authRepositoryProvider).signIn(
          signInForm: state,
        );
    return user;
  }
}
