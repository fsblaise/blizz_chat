import 'package:blizz_chat/features/chats/infrastructure/contacts_repository.dart';
import 'package:blizz_chat/features/core/infrastructure/providers/firebase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_provider.g.dart';

@riverpod
ContactsRepository contactsRepository(ContactsRepositoryRef ref) {
  return ContactsRepository(ref.read(firebaseFirestoreProvider));
}
