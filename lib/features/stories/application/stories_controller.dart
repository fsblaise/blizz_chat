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
    print(user);
    await user.when(data: (value) async {
      final story = await ref.watch(storyRepositoryProvider).addStory(caption, file, value);
      final prevState = await future;
      state = AsyncValue.data([...prevState, story]);
      return story;
    }, error: (e, s) {
      return null;
    }, loading: () {
      print('wtf');
    });
  }

  Future<void> removeStory(Story story) async {
    try {
      await ref.watch(storyRepositoryProvider).removeStory(story);
      final prevState = await future;
      prevState.remove(story);
      state = AsyncValue.data([...prevState]);
    } catch (e) {
      print('Error in removeStory: $e');
    }
  }
}
