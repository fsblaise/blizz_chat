import 'package:blizz_chat/features/core/infrastructure/firebase_provider.dart';
import 'package:blizz_chat/features/stories/infrastructure/stories_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stories_provider.g.dart';

@riverpod
StoryRepository storyRepository(StoryRepositoryRef ref) {
  return StoryRepository(
      ref.read(firebaseFirestoreProvider), ref.read(firebaseAuthProvider), ref.read(firebaseStorageProvider));
}
