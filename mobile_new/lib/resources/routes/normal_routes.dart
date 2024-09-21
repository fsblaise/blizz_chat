import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';

final normalRoutes = [
  AutoRoute(
    page: WelcomeRoute.page,
    path: '/',
    initial: true,
  ),
  AutoRoute(
    page: LoginRoute.page,
    path: '/login',
  ),
  AutoRoute(
    page: RegisterRoute.page,
    path: '/register',
  ),
  AutoRoute(
    page: CounterRoute.page,
    path: '/counter',
  ),
  AutoRoute(
    page: SettingsRoute.page,
    path: '/settings',
  ),
  AutoRoute(
    page: MessagingRoute.page,
    path: '/messaging/:chatId',
  ),
];
