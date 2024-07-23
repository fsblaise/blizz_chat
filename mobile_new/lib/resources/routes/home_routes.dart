import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';

final homeRoutes = [
  AutoRoute(
    page: HomeRoute.page,
    path: '/home',
    initial: true,
  ),
  AutoRoute(
    page: ChatsRoute.page,
    path: '/chats',
    initial: true,
  ),
  AutoRoute(
    page: MessagingRoute.page,
    path: '/messaging',
    initial: true,
  ),
  AutoRoute(
    page: StoriesRoute.page,
    path: '/stories',
    initial: true,
  ),
  AutoRoute(
    page: MapRoute.page,
    path: '/map',
    initial: true,
  ),
  AutoRoute(
    page: SettingsRoute.page,
    path: '/settings',
    initial: true,
  ),
];
