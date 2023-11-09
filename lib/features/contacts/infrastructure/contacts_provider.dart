import 'package:blizz_chat/features/contacts/infrastructure/contacts_repository_impl.dart';
import 'package:blizz_chat/features/core/infrastructure/providers/firebase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_provider.g.dart';

@riverpod
ContactsRepositoryImpl contactsRepostory(ContactsRepostoryRef ref) {
  return ContactsRepositoryImpl(ref.read(firebaseFirestoreProvider));
}
