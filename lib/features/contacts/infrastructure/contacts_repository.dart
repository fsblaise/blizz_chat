import 'package:blizz_chat/features/contacts/domain/base_contacts_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContactsRepository extends BaseContactsRepository {
  ContactsRepository(this._fStore) : super(_fStore);

  final FirebaseFirestore _fStore;

  /// Returns a list of maps, <br>
  /// where each map contains a userId and the name of the User.
  @override
  Future<List<Map<String, String>>> getContacts(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await userCollection.doc(userId).get();
      final userMap = userSnapshot.data() as Map<String, dynamic>;
      FbUser userObj = FbUser.fromJson(userMap);
      print('firebase?');
      return userObj.contacts;
    } catch (e) {
      print(e);
      return [];
    }
  }

  /// Adds a user (contact) to the contacts array of the logged in user.
  @override
  Future<void> addContact(FbUser contact, String userId) async {
    try {
      Map<String, String> contactMap = {'id': contact.id, 'fullName': contact.fullName};
      await userCollection.doc(userId).update({
        'contacts': FieldValue.arrayUnion([contactMap])
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Removes a user (contact) from the contacts array of the logged in user.
  @override
  Future<void> removeContact(String deleteId, String deleteName, String userId) async {
    try {
      await userCollection.doc(userId).update({
        'contacts': FieldValue.arrayRemove([
          {'id': deleteId, 'fullName': deleteName}
        ])
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Fetches a user by email.
  @override
  Future<List<FbUser?>> getUserByEmail(String email) async {
    try {
      QuerySnapshot userSnapshot = await userCollection.where('email', isEqualTo: email).get();
      final userDocs = userSnapshot.docs;
      final userMap = userDocs[0].data() as Map<String, dynamic>;
      FbUser userObj = FbUser.fromJson(userMap);
      return [userObj];
    } catch (e) {
      print(e);
      return [];
    }
  }

  /// Fetches users by fullName.
  @override
  Future<List<FbUser?>> getUsersByFullName(String fullName) async {
    try {
      List<FbUser> users = [];
      QuerySnapshot userSnapshot = await userCollection.where('fullName', isEqualTo: fullName).get();
      final userDocs = userSnapshot.docs;

      for (var doc in userDocs) {
        final userMap = doc.data() as Map<String, dynamic>;
        final userObj = FbUser.fromJson(userMap);
        users.add(userObj);
      }

      return users;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
