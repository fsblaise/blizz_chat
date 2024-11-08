import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/routes/story_routes.dart';

final homeRoutes = [
  AutoRoute(
    page: ChatsRoute.page,
    path: 'chats',
  ),
  AutoRoute(
    page: StoriesRoute.page,
    children: [...storyRoutes],
  ),
  AutoRoute(
    page: MapRoute.page,
    path: 'map',
  ),
];
