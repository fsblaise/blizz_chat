import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/stories/view/story_card.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StoriesListPage extends StatefulWidget {
  const StoriesListPage({super.key});

  @override
  State<StoriesListPage> createState() => _StoriesListPageState();
}

class _StoriesListPageState extends State<StoriesListPage> {
  late final AuthCubit _authCubit;
  late final StoriesCubit _storiesCubit;
  late final UserProfile? _user;

  @override
  void initState() {
    _authCubit = context.read<AuthCubit>();
    _user = _authCubit.getCurrentUser();
    _storiesCubit = context.read<StoriesCubit>();
    _storiesCubit.fetchStories();
    super.initState();
  }

  Widget _renderList() {
    return BlocBuilder<StoriesCubit, StoriesState>(
      builder: (context, state) {
        if (state is StoriesFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StoriesFetched && state.stories.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: RefreshIndicator(
              onRefresh: () async {
                _storiesCubit.fetchStories();
              },
              child: ListView.builder(
                itemCount: state.stories.length,
                itemBuilder: (context, index) {
                  return StoryCard(
                    data: state.stories[index],
                    user: _user!,
                  );
                },
              ),
            ),
          );
        } else if (state is StoriesError) {
          return Center(child: Text(state.message));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              _storiesCubit.fetchStories();
            },
            child: ListView(
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'No stories found',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'camera',
        onPressed: () async {
          await availableCameras().then(
            (value) => context.router.push(
              CameraViewRoute(cameras: value),
            ),
          );
        },
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      body: _renderList(),
    );
  }
}
