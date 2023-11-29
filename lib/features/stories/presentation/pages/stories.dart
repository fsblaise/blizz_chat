import 'package:blizz_chat/features/stories/presentation/pages/camera_view.dart';
import 'package:blizz_chat/features/stories/presentation/widgets/story_card.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesPage extends ConsumerWidget {
  const StoriesPage({this.iterator = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], super.key});
  final List<int> iterator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        children: iterator.map((e) => const StoryCard()).toList(),
      ),
    );
  }
}
