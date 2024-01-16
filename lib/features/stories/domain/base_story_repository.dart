import 'dart:io';

import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/stories/domain/story_model.dart';

abstract class BaseStoryRepository extends CollectionsRepository {
  BaseStoryRepository(super.fStore);

  Future<List<Story>> getStories();
  Future<Story> addStory(String caption, File file, FbUser user);
  Future<void> removeStory(String id);
}
