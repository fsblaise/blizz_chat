import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';

final homeRoutes = [
  AutoRoute(
    page: ChatsRoute.page,
    path: 'chats',
  ),
  AutoRoute(
    page: StoriesRoute.page,
    path: 'stories',
  ),
  AutoRoute(
    page: MapRoute.page,
    path: 'map',
  ),
];
