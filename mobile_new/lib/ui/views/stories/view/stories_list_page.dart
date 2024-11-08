import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/stories/view/story_card.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StoriesListPage extends StatefulWidget {
  const StoriesListPage({super.key});

  @override
  State<StoriesListPage> createState() => _StoriesListPageState();
}

class _StoriesListPageState extends State<StoriesListPage> {
  late final StoriesCubit _storiesCubit;
  late final AuthCubit _authCubit;
  late final UserProfile? _user;

  @override
  void initState() {
    _storiesCubit = context.read<StoriesCubit>();
    _authCubit = context.read<AuthCubit>();
    _user = _authCubit.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await availableCameras().then((value) => context.router.push(
                CameraViewRoute(cameras: value),
              ));
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      body: BlocBuilder<StoriesCubit, StoriesState>(
        builder: (context, state) {
          if (state is StoriesFetching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StoriesFetched) {
            return GridView.count(
              crossAxisCount: 2,
              children: state.stories
                  .map((e) => StoryCard(
                        data: e,
                        user: _user!,
                      ))
                  .toList(),
            );
          } else if (state is StoriesError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
