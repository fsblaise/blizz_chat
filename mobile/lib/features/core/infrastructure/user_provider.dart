import 'package:blizz_chat/features/core/infrastructure/firebase_provider.dart';
import 'package:blizz_chat/features/core/infrastructure/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref.read(firebaseFirestoreProvider));
}
