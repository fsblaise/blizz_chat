import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class ContactsRepository {
  Future<List<FbUser>> getContacts();
  Future<void> addContact();
  Future<void> removeContact();
}
