import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({required this.data, required this.user, super.key});
  final Story data;
  final UserProfile user;

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  _removeStory(BuildContext context, Story story) async {
    await context.read<StoriesCubit>().delete(story.id);
    Navigator.of(context).pop();
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
      onTap: () {
        context.router.push(
          StoryViewerRoute(data: widget.data),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.data.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                      Text(widget.data.fullName),
                      if (widget.user.email == widget.data.email)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  getIt
                                      .get<DialogService>()
                                      .showModalSheetDialog(
                                    context,
                                    [
                                      ListTile(
                                        onTap: () =>
                                            _removeStory(context, widget.data),
                                        leading: const Icon(Icons.delete),
                                        title: Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                                icon: const Icon(Icons.more_vert),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
