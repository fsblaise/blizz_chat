import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';

final normalRoutes = [
  AutoRoute(
    page: WelcomeRoute.page,
    path: '/',
    initial: true,
  ),
  AutoRoute(
    page: CheckEmailRoute.page,
    path: '/check-email',
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
    page: ManageUsersRoute.page,
    path: '/manage-users',
  ),
  AutoRoute(
    page: MessagingRoute.page,
    path: '/messaging/:chatId',
  ),
];
