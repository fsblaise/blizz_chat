import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/stories/application/stories_controller.dart';
import 'package:blizz_chat/features/stories/domain/story_model.dart';
import 'package:blizz_chat/features/stories/presentation/pages/story_viewer.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class StoryCard extends ConsumerWidget {
  const StoryCard({required this.data, super.key});
  final Story data;

  _removeStory(BuildContext context, WidgetRef ref, Story story) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final storiesController = ref.read(storiesControllerProvider.notifier);
    try {
      await storiesController.removeStory(story);
      Navigator.pop(context);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(_i10n.storyDeleteSuccess),
        elevation: 20.0,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(_i10n.storyDeleteFail),
        elevation: 20.0,
      ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider);
    return InkWell(
      onLongPress: () {
        if (user!.uid == data.userId) {
          showModalBottomSheet(
              showDragHandle: true,
              enableDrag: true,
              isDismissible: true,
              context: context,
              builder: (context) => SizedBox(
                    height: 80,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                          child: Column(
                        children: [
                          ListTile(
                            onTap: () => _removeStory(context, ref, data),
                            leading: const Icon(Icons.delete),
                            title: Text(_i10n.delete),
                          ),
                        ],
                      )),
                    ),
                  ));
        }
      },
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (contect) => StoryViewerPage(
                      data: data,
                    )));
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          data.imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(data.fullName),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
