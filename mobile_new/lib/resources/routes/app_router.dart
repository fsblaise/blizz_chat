import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/home_routes.dart';
import 'package:blizz_chat/resources/routes/normal_routes.dart';
import 'package:blizz_chat/ui/ui.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...homeRoutes,
        ...normalRoutes,
      ];
}
