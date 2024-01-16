import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/stories/domain/story_model.dart';
import 'package:blizz_chat/features/stories/presentation/pages/story_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoryCard extends ConsumerWidget {
  const StoryCard({required this.data, super.key});
  final Story data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider);
    return InkWell(
      onLongPress: () {
        if (user!.uid == data.userId) {
          // TODO: bottomsheet to with option to remove story
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
