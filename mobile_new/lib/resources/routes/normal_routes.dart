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
    initial: true,
  ),
  AutoRoute(
    page: RegisterRoute.page,
    path: '/register',
    initial: true,
  ),
  AutoRoute(
    page: CounterRoute.page,
    path: '/counter',
    initial: true,
  ),
];
