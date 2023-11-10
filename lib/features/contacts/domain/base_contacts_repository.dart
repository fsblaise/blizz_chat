import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseContactsRepository extends CollectionsRepository {
  BaseContactsRepository(super.fStore);

  Future<List<Map<String, String>>> getContacts(String userId);
  Future<void> addContact(FbUser contact, String userId);
  Future<void> removeContact(String deleteId, String userId);
}
