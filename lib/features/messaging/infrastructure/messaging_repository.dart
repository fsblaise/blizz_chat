import 'package:blizz_chat/features/messaging/domain/base_messaging_repository.dart';
import 'package:blizz_chat/features/messaging/domain/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagingRepository extends BaseMessagingRepository {
  MessagingRepository(this._fStore) : super(_fStore);

  final FirebaseFirestore _fStore;

  /// Returns a list of maps, <br>
  /// where each map contains an id and a name for a chat. <br>
  /// It references a chat document in a different collection.
  @override
  Future<List<Message>> getMoreMessages(String chatId) async {
    try {
      // TODO: rewrite this to fetch more messages on call from the last loaded message
      List<Message> messages = [];
      QuerySnapshot msgSnapshot = await chatCollection.doc(chatId).collection('Messages').limit(10).get();
      final msgList = msgSnapshot.docs;
      for (var msg in msgList) {
        final msgMap = msg.data() as Map<String, dynamic>;
        final msgObj = Message.fromJson(msgMap);
        messages.add(msgObj);
      }
      return messages;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Stream<List<Message>> getMessageStream(String chatId) {
    try {
      return chatCollection
          .doc(chatId)
          .collection('Messages')
          .orderBy('timestamp', descending: true)
          .limit(10)
          .snapshots()
          .map((event) {
        List<Message> messages = [];
        for (var msg in event.docs) {
          messages.add(Message.fromJson(msg.data()));
        }
        return messages;
      });
    } catch (e) {
      print(e);
      return Stream.value([]);
    }
  }

  /// Adds a user (contact) to the contacts array of the logged in user.<br>
  /// Also adds a chat reference object to the chats array.
  @override
  Future<Message> addMessage(Message msg) async {
    try {
      return Message('id', 'from', 'to', 'text', 'timestamp');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Deletes a chat from the chats array of the logged in user.<br>
  /// Also deletes that chat from the database.
  @override
  Future<void> removeMessage(String msgId) async {
    try {
      // await userCollection.doc(userId).update({
      //   'contacts': FieldValue.arrayRemove([
      //     {'id': deleteId, 'fullName': deleteName}
      //   ])
      // });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
