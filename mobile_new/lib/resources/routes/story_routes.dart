import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';

final storyRoutes = [
  AutoRoute(
    page: StoriesListRoute.page,
    path: 'list',
    initial: true,
  ),
  AutoRoute(
    page: CameraViewRoute.page,
    path: 'camera',
  ),
  AutoRoute(
    page: DisplayPictureRoute.page,
    path: 'picture',
  ),
  AutoRoute(
    page: StoryViewerRoute.page,
    path: 'story',
  ),
];
