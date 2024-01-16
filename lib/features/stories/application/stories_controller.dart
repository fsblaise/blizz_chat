import 'dart:io';

import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/stories/domain/story_model.dart';
import 'package:blizz_chat/features/stories/infrastructure/stories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stories_controller.g.dart';

@riverpod
class StoriesController extends _$StoriesController {
  @override
  FutureOr<List<Story>> build() async {
    print('build runs inside stories controller');
    List<Story> stories = [];

    stories = await ref.watch(storyRepositoryProvider).getStories();
    return stories;
  }

  Future<Story?> addStory(String caption, File file) async {
    final user = ref.watch(userObjectProvider);
    try {
      final userValue = user.value;
      if (userValue != null) {
        final story = await ref.watch(storyRepositoryProvider).addStory(caption, file, userValue);
        final prevState = await future;
        state = AsyncValue.data([...prevState, story]);
        return story;
      }
      return null;
    } catch (e) {
      print('Error in addStory: $e');
      return null;
    }
  }
}
