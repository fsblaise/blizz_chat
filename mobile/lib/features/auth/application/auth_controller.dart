import 'package:blizz_chat/features/auth/domain/auth_state.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final authState = await _loadToken();
    return authState;
  }

  Future<AuthState> _loadToken() async {
    try {
      final user = await ref.read(authRepositoryProvider).fetchUserFromToken();
      final authState = Authenticated(user: user);
      state = AsyncValue.data(authState);
      return authState;
    } catch (e) {
      // If there is no token stored, the api will send an error of some sort and the user will be unauthenticated.
      const authState = Unauthenticated();
      state = const AsyncValue.data(authState);
      return authState;
    }
  }
}
