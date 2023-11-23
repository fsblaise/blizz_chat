import 'package:blizz_chat/features/messaging/domain/base_messaging_repository.dart';
import 'package:blizz_chat/features/messaging/domain/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessagingRepository extends BaseMessagingRepository {
  MessagingRepository(this._fStore, this._auth, this.chatId) : super(_fStore);

  final FirebaseFirestore _fStore;
  final FirebaseAuth _auth;
  final String chatId;

  /// Returns a list of maps, <br>
  /// where each map contains an id and a name for a chat. <br>
  /// It references a chat document in a different collection.
  @override
  Future<List<Message>> getMoreMessages() async {
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

  Future<List<Message>> getInitialMessages() async {
    try {
      print('initialfetch');
      // TODO: rewrite this to fetch more messages on call from the last loaded message
      List<Message> messages = [];
      QuerySnapshot msgSnapshot = await chatCollection
          .doc(chatId)
          .collection('Messages')
          .orderBy('timestamp', descending: true)
          .limit(20)
          .get();
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
  Stream<List<Message>> getMessageStream() {
    try {
      print('Does this run?');
      return chatCollection
          .doc(chatId)
          .collection('Messages')
          .orderBy('timestamp', descending: true)
          .limit(1)
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

  @override
  Future<Message> addMessage(String msgText) async {
    try {
      final msg = Message(chatCollection.doc().id, _auth.currentUser!.uid, msgText, DateTime.now().toIso8601String());
      await chatCollection.doc(chatId).collection('Messages').add(msg.toJson());
      return msg;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> removeMessage(String msgId) async {
    try {
      await chatCollection.doc(chatId).collection('Messages').doc(msgId).delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
