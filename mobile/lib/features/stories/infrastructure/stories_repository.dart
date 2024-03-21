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

      final story = Story(id, caption, DateTime.now().toIso8601String(), user.id, user.fullName, url, ext);
      await storyCollection.doc(story.id).set(story.toJson());
      return story;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Story>> getStories(FbUser user) async {
    try {
      print('fetching stories');
      List<Story> stories = [];
      List<String> fetchIds = [user.id, ...user.contacts.map((e) => e['id'] as String).toList()];
      print(fetchIds);
      QuerySnapshot storySnapshot = await storyCollection
          .where('userId', whereIn: fetchIds)
          .orderBy('timestamp', descending: true)
          .limit(10)
          .get();
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
  Future<void> removeStory(Story story) async {
    final storageRef = _storage.ref();
    try {
      // List splits = file.path.split('.');
      // String ext = splits.removeLast();
      await storageRef.child('Stories/${story.id}.${story.extension}').delete();
      await storyCollection.doc(story.id).delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
