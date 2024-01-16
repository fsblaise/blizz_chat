import 'package:blizz_chat/features/stories/application/stories_controller.dart';
import 'package:blizz_chat/features/stories/presentation/pages/camera_view.dart';
import 'package:blizz_chat/features/stories/presentation/widgets/story_card.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesPage extends ConsumerWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(storiesControllerProvider);
    return stories.when(data: (data) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await availableCameras().then((value) =>
                Navigator.push(context, CupertinoPageRoute(builder: (contect) => CameraViewPage(cameras: value))));
          },
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          child: const Icon(Icons.add_a_photo_outlined),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: data.map((e) => StoryCard(data: e)).toList(),
        ),
      );
    }, error: (e, s) {
      return const Center(child: Text('Something went wrong'));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
