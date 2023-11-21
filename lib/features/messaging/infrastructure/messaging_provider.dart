import 'package:blizz_chat/features/core/infrastructure/providers/firebase_provider.dart';
import 'package:blizz_chat/features/messaging/infrastructure/messaging_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messaging_provider.g.dart';

@riverpod
MessagingRepository messagingRepository(MessagingRepositoryRef ref, String chatId) {
  return MessagingRepository(ref.read(firebaseFirestoreProvider), ref.read(firebaseAuthProvider), chatId);
}
