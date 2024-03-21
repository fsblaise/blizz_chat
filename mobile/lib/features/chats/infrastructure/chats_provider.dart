import 'package:blizz_chat/features/chats/infrastructure/chats_repository.dart';
import 'package:blizz_chat/features/core/infrastructure/firebase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chats_provider.g.dart';

@riverpod
ChatsRepository chatsRepository(ChatsRepositoryRef ref) {
  return ChatsRepository(ref.read(firebaseFirestoreProvider));
}
