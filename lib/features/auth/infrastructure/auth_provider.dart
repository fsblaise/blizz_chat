import 'package:blizz_chat/features/auth/domain/sign_up_repository.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/core/presentation/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.read(firebaseAuthProvider), ref.read(firebaseFirestoreProvider));
}

@riverpod
Stream<User?> user(UserRef ref) {
  FirebaseAuth auth = ref.read(firebaseAuthProvider);
  return auth.authStateChanges();
}
