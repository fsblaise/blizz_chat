import 'package:blizz_chat/features/contacts/domain/contacts_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  ContactsRepositoryImpl(this._fStore);

  final FirebaseFirestore _fStore;

  @override
  Future<void> addContact() {
    // TODO: implement addContact
    throw UnimplementedError();
  }

  @override
  Future<List<FbUser>> getContacts() {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

  @override
  Future<void> removeContact() {
    // TODO: implement removeContact
    throw UnimplementedError();
  }
}
