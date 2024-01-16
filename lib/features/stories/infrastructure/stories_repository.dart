import 'dart:io';

import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/stories/domain/base_story_repository.dart';
import 'package:blizz_chat/features/stories/domain/story_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StoryRepository extends BaseStoryRepository {
  StoryRepository(this._fStore, this._auth, this._storage) : super(_fStore);

  final FirebaseFirestore _fStore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  /// Returns a list of maps, <br>
  /// where each map contains an id and a name for a chat. <br>
  /// It references a chat document in a different collection.
  // @override
  // Future<List<Message>> getMoreMessages() async {
  //   try {
  //     // TODO: rewrite this to fetch more messages on call from the last loaded message
  //     List<Message> messages = [];
  //     QuerySnapshot msgSnapshot = await chatCollection.doc(chatId).collection('Messages').limit(10).get();
  //     final msgList = msgSnapshot.docs;
  //     for (var msg in msgList) {
  //       final msgMap = msg.data() as Map<String, dynamic>;
  //       final msgObj = Message.fromJson(msgMap);
  //       messages.add(msgObj);
  //     }
  //     return messages;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Future<List<Message>> getInitialMessages() async {
  //   try {
  //     print('initialfetch');
  //     // TODO: rewrite this to fetch more messages on call from the last loaded message
  //     List<Message> messages = [];
  //     QuerySnapshot msgSnapshot = await chatCollection
  //         .doc(chatId)
  //         .collection('Messages')
  //         .orderBy('timestamp', descending: true)
  //         .limit(20)
  //         .get();
  //     final msgList = msgSnapshot.docs;
  //     for (var msg in msgList) {
  //       final msgMap = msg.data() as Map<String, dynamic>;
  //       final msgObj = Message.fromJson(msgMap);
  //       messages.add(msgObj);
  //     }
  //     return messages;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Stream<List<Message>> getInitialMessageStream() {
  //   try {
  //     print('Does this run?');
  //     return chatCollection
  //         .doc(chatId)
  //         .collection('Messages')
  //         .orderBy('timestamp', descending: true)
  //         .limit(20)
  //         .snapshots()
  //         .map((event) {
  //       List<Message> messages = [];
  //       for (var msg in event.docs) {
  //         messages.add(Message.fromJson(msg.data()));
  //       }
  //       return messages;
  //     });
  //   } catch (e) {
  //     print(e);
  //     return Stream.value([]);
  //   }
  // }

  // @override
  // Stream<List<Message>> getMessageStream() {
  //   try {
  //     print('Does this run?');
  //     return chatCollection
  //         .doc(chatId)
  //         .collection('Messages')
  //         .orderBy('timestamp', descending: true)
  //         .limit(1)
  //         .snapshots()
  //         .map((event) {
  //       List<Message> messages = [];
  //       for (var msg in event.docs) {
  //         messages.add(Message.fromJson(msg.data()));
  //       }
  //       return messages;
  //     });
  //   } catch (e) {
  //     print(e);
  //     return Stream.value([]);
  //   }
  // }

  // @override
  // Future<Message> addMessage(String msgText) async {
  //   try {
  //     final msg = Message(chatCollection.doc().id, _auth.currentUser!.uid, msgText, DateTime.now().toIso8601String());
  //     await chatCollection.doc(chatId).collection('Messages').add(msg.toJson());
  //     return msg;
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> removeMessage(String msgId) async {
  //   try {
  //     await chatCollection.doc(chatId).collection('Messages').doc(msgId).delete();
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  @override
  Future<Story> addStory(String caption, File file, FbUser user) async {
    try {
      final storageRef = _storage.ref();
      // Create the file metadata
      final metadata = SettableMetadata(contentType: "image/jpeg");
      String id = storyCollection.doc().id;
      List splits = file.path.split('.');
      String ext = splits.removeLast();
      // Upload file and metadata to the path 'images/mountains.jpg'
      await storageRef.child('Stories/$id.$ext').putFile(file, metadata);

      final url = await storageRef.child('Stories/$id.$ext').getDownloadURL();

      final story = Story(id, caption, DateTime.now().toIso8601String(), user.id, user.fullName, url);
      await storyCollection.doc(story.id).set(story.toJson());
      return story;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Story>> getStories() async {
    try {
      print('fetching stories');
      List<Story> stories = [];
      QuerySnapshot storySnapshot = await storyCollection.orderBy('timestamp', descending: true).limit(10).get();
      final storyList = storySnapshot.docs;
      for (var story in storyList) {
        final storyMap = story.data() as Map<String, dynamic>;
        print(storyMap);
        final storyObj = Story.fromJson(storyMap);
        print(storyObj);
        stories.add(storyObj);
      }
      return stories;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> removeStory(String id) {
    // TODO: implement removeStory
    throw UnimplementedError();
  }
}
