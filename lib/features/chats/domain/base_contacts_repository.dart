import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseContactsRepository extends CollectionsRepository {
  BaseContactsRepository(super.fStore);

  Future<List<Map<String, dynamic>>> getContacts(String userId);
  Future<Map<String, dynamic>> addContact(FbUser contact, FbUser user);
  Future<void> removeContact(String deleteId, String deleteName, String userId);
  Future<List<FbUser?>> getUserByEmail(String email);
  Future<List<FbUser?>> getUsersByFullName(String fullName);
}
