import 'package:blizz_chat/features/chats/domain/base_chats_repository.dart';
import 'package:blizz_chat/features/chats/domain/chat_model.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  /// Adds a chat reference object to the chats array of the logged in user.
  @override
  Future<Map<String, dynamic>> addChat(List<Map<String, dynamic>> chats, List<FbUser> contacts, FbUser user) async {
    if (contacts.length == 1) {
      final contact = contacts[0];

      try {
        final chatSnapshot = await chatCollection
            .where('participants', arrayContains: {'id': user.id, 'fullName': user.fullName})
            .where('isGroupChat', isEqualTo: false)
            .get();
        final chatDocs = chatSnapshot.docs.where((doc) {
          var participants = doc['participants'];
          return participants
              .any((participant) => participant['id'] == contact.id && participant['fullName'] == contact.fullName);
        }).toList();

        if (chatDocs.isNotEmpty) {
          final elementMap = chatDocs[0].data();
          final chat = Chat.fromJson(elementMap);

          Map<String, String> userChatsMap = {'id': chat.id, 'name': chat.chatName ?? contact.fullName};

          if (chats.any((element) => element['id'] == chat.id)) return userChatsMap;

          await userCollection.doc(user.id).update({
            'chats': FieldValue.arrayUnion([userChatsMap])
          });

          return userChatsMap;
        } else {
          final chatId = userCollection.doc().id;

          Map<String, dynamic> userChatsMap = {'id': chatId, 'name': contact.fullName};
          Map<String, dynamic> contactChatsMap = {'id': chatId, 'name': user.fullName};

          await userCollection.doc(user.id).update({
            'chats': FieldValue.arrayUnion([userChatsMap])
          });
          // we have to add the chat to the contact's chats list
          await userCollection.doc(contact.id).update({
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
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    } else {
      return await addGroupChat(contacts, user);
    }
  }

  /// Deletes a chat from the chats array of the logged in user.<br>
  /// Doesn't delete that chat from the database.
  @override
  Future<void> removeChat(String deleteId, String deleteName, String userId) async {
    try {
      await userCollection.doc(userId).update({
        'chats': FieldValue.arrayRemove([
          {'id': deleteId, 'name': deleteName}
        ])
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // @override
  // Future<Map<String, dynamic>> addChat(FbUser contact, FbUser user) async {
  //   final chat = await chatCollection.where('participants.id', isEqualTo: user.id).get();
  //   print(chat);
  //   return {};
  //   // String chatId = '';
  //   // Map<String, dynamic> userChatsMap = {'id': chatId, 'name': contact.fullName};

  //   // try {
  //   //   await userCollection.doc(user.id).update({
  //   //     'chats': FieldValue.arrayUnion([userChatsMap])
  //   //   });
  //   // } catch (e) {
  //   //   print(e);
  //   //   rethrow;
  //   // }
  // }

  @override
  Future<Map<String, dynamic>> addGroupChat(List<FbUser> contacts, FbUser user) async {
    try {
      final chatSnapshot = await chatCollection
          .where('participants', arrayContains: {'id': user.id, 'fullName': user.fullName})
          .where('isGroupChat', isEqualTo: true)
          .get();

      final chatDocs = chatSnapshot.docs.where((doc) {
        var participants = doc['participants'];

        return contacts.every((contact) => participants.any((participant) => participant['id'] == contact.id));
      }).toList();

      if (chatDocs.isNotEmpty) {
        final elementMap = chatDocs[0].data();
        final chat = Chat.fromJson(elementMap);

        Map<String, String> userChatsMap = {'id': chat.id, 'name': chat.chatName as String};

        await userCollection.doc(user.id).update({
          'chats': FieldValue.arrayUnion([userChatsMap])
        });

        return userChatsMap;
      } else {
        final chatId = userCollection.doc().id;
        List<Map<String, String>> participants = [];

        String name = user.fullName.split(' ')[0];
        for (var contact in contacts) {
          name += ', ' + contact.fullName.split(' ')[0];
        }

        Map<String, dynamic> userChatsMap = {'id': chatId, 'name': name};

        await userCollection.doc(user.id).update({
          'chats': FieldValue.arrayUnion([userChatsMap])
        });
        participants.add({'id': user.id, 'fullName': user.fullName});

        // we have to add the current chat to the contacts' chats list
        for (var contact in contacts) {
          Map<String, dynamic> contactChatsMap = {'id': chatId, 'name': name};
          await userCollection.doc(contact.id).update({
            'chats': FieldValue.arrayUnion([contactChatsMap])
          });
          participants.add({'id': contact.id, 'fullName': contact.fullName});
        }

        await chatCollection.doc(chatId).set(Chat(chatId, participants, true, name).toJson());
        return userChatsMap;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
