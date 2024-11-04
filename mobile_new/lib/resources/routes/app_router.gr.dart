// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatsPage(),
      );
    },
    CheckEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CheckEmailPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CounterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    ManageUsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageUsersPage(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapPage(),
      );
    },
    MessagingRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessagingRouteArgs>(
          orElse: () => MessagingRouteArgs(
                chatId: pathParams.getString('chatId'),
                title: pathParams.getString('title'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MessagingPage(
          chatId: args.chatId,
          title: args.title,
          key: args.key,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    StoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoriesPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [ChatsPage]
class ChatsRoute extends PageRouteInfo<void> {
  const ChatsRoute({List<PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CheckEmailPage]
class CheckEmailRoute extends PageRouteInfo<void> {
  const CheckEmailRoute({List<PageRouteInfo>? children})
      : super(
          CheckEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CounterPage]
class CounterRoute extends PageRouteInfo<void> {
  const CounterRoute({List<PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    String? email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.email,
    this.key,
  });

  final String? email;

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [ManageUsersPage]
class ManageUsersRoute extends PageRouteInfo<void> {
  const ManageUsersRoute({List<PageRouteInfo>? children})
      : super(
          ManageUsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageUsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapPage]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessagingPage]
class MessagingRoute extends PageRouteInfo<MessagingRouteArgs> {
  MessagingRoute({
    required String chatId,
    required String title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MessagingRoute.name,
          args: MessagingRouteArgs(
            chatId: chatId,
            title: title,
            key: key,
          ),
          rawPathParams: {
            'chatId': chatId,
            'title': title,
          },
          initialChildren: children,
        );

  static const String name = 'MessagingRoute';

  static const PageInfo<MessagingRouteArgs> page =
      PageInfo<MessagingRouteArgs>(name);
}

class MessagingRouteArgs {
  const MessagingRouteArgs({
    required this.chatId,
    required this.title,
    this.key,
  });

  final String chatId;

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'MessagingRouteArgs{chatId: $chatId, title: $title, key: $key}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    String? email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.email,
    this.key,
  });

  final String? email;

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [StoriesPage]
class StoriesRoute extends PageRouteInfo<void> {
  const StoriesRoute({List<PageRouteInfo>? children})
      : super(
          StoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
