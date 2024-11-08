import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/ui/views/stories/view/story_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({required this.data, required this.user, super.key});
  final Story data;
  final UserProfile user;

  _removeStory(BuildContext context, Story story) async {
    // final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    // final storiesController = ref.read(storiesControllerProvider.notifier);
    // try {
    //   await storiesController.removeStory(story);
    //   Navigator.pop(context);
    //   scaffoldMessenger.showSnackBar(SnackBar(
    //     content: Text(_i10n.storyDeleteSuccess),
    //     elevation: 20.0,
    //   ));
    // } catch (e) {
    //   scaffoldMessenger.showSnackBar(SnackBar(
    //     content: Text(_i10n.storyDeleteFail),
    //     elevation: 20.0,
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (user.email == data.email) {
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
                            onTap: () => _removeStory(context, data),
                            leading: const Icon(Icons.delete),
                            title: Text('Delete'),
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
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
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
                    Text(data.email),
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
