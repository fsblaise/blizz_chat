import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/chats/domain/base_chats_repository.dart';
import 'package:blizz_chat/features/chats/domain/chat_model.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatsRepository extends BaseChatsRepository {
  ChatsRepository(this._fStore) : super(_fStore);

  final FirebaseFirestore _fStore;

  /// Returns a list of maps, <br>
  /// where each map contains an id and a name for a chat. <br>
  /// It references a chat document in a different collection.
  @override
  Future<List<Map<String, dynamic>>> getChats(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await userCollection.doc(userId).get();
      final userMap = userSnapshot.data() as Map<String, dynamic>;
      FbUser userObj = FbUser.fromJson(userMap);
      print('firebase?');
      return userObj.chats;
    } catch (e) {
      print(e);
      return [];
    }
  }

  /// Adds a user (contact) to the contacts array of the logged in user.<br>
  /// Also adds a chat reference object to the chats array.
  @override
  Future<Map<String, dynamic>> addContact(FbUser contact, FbUser user) async {
    try {
      final chatId = userCollection.doc().id;
      // final userSnapshot = await userCollection.doc(userId).get();
      // final userMap = userSnapshot.data() as Map<String, dynamic>;
      // FbUser user = FbUser.fromJson(userMap);

      Map<String, String> userContactMap = {'id': contact.id, 'fullName': contact.fullName};
      Map<String, String> contactContactMap = {'id': user.id, 'fullName': user.fullName};
      Map<String, dynamic> userChatsMap = {'id': chatId, 'name': contact.fullName};
      Map<String, dynamic> contactChatsMap = {'id': chatId, 'name': user.fullName};

      await userCollection.doc(user.id).update({
        'contacts': FieldValue.arrayUnion([userContactMap]),
        'chats': FieldValue.arrayUnion([userChatsMap])
      });
      // we have to add the current user to the contact's contacts list
      await userCollection.doc(contact.id).update({
        'contacts': FieldValue.arrayUnion([contactContactMap]),
        'chats': FieldValue.arrayUnion([contactChatsMap])
      });
      await chatCollection.doc(chatId).set(Chat(
              chatId,
              [
                {'id': user.id, 'fullName': user.fullName},
                {'id': contact.id, 'fullName': contact.fullName}
              ],
              false,
              null)
          .toJson());
      return userChatsMap;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Deletes a chat from the chats array of the logged in user.<br>
  /// Also deletes that chat from the database.
  @override
  Future<void> removeChat(String deleteId, String deleteName, String userId) async {
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
