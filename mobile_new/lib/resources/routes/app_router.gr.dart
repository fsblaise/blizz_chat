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
    CameraViewRoute.name: (routeData) {
      final args = routeData.argsAs<CameraViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CameraViewPage(
          cameras: args.cameras,
          key: args.key,
        ),
      );
    },
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
    DisplayPictureRoute.name: (routeData) {
      final args = routeData.argsAs<DisplayPictureRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DisplayPicturePage(
          imgPath: args.imgPath,
          key: args.key,
        ),
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
    StoriesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoriesListPage(),
      );
    },
    StoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoriesPage(),
      );
    },
    StoryViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StoryViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoryViewerPage(
          data: args.data,
          key: args.key,
        ),
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
/// [CameraViewPage]
class CameraViewRoute extends PageRouteInfo<CameraViewRouteArgs> {
  CameraViewRoute({
    required List<CameraDescription> cameras,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CameraViewRoute.name,
          args: CameraViewRouteArgs(
            cameras: cameras,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraViewRoute';

  static const PageInfo<CameraViewRouteArgs> page =
      PageInfo<CameraViewRouteArgs>(name);
}

class CameraViewRouteArgs {
  const CameraViewRouteArgs({
    required this.cameras,
    this.key,
  });

  final List<CameraDescription> cameras;

  final Key? key;

  @override
  String toString() {
    return 'CameraViewRouteArgs{cameras: $cameras, key: $key}';
  }
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
/// [DisplayPicturePage]
class DisplayPictureRoute extends PageRouteInfo<DisplayPictureRouteArgs> {
  DisplayPictureRoute({
    required String imgPath,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DisplayPictureRoute.name,
          args: DisplayPictureRouteArgs(
            imgPath: imgPath,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DisplayPictureRoute';

  static const PageInfo<DisplayPictureRouteArgs> page =
      PageInfo<DisplayPictureRouteArgs>(name);
}

class DisplayPictureRouteArgs {
  const DisplayPictureRouteArgs({
    required this.imgPath,
    this.key,
  });

  final String imgPath;

  final Key? key;

  @override
  String toString() {
    return 'DisplayPictureRouteArgs{imgPath: $imgPath, key: $key}';
  }
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
/// [StoriesListPage]
class StoriesListRoute extends PageRouteInfo<void> {
  const StoriesListRoute({List<PageRouteInfo>? children})
      : super(
          StoriesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoriesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [StoryViewerPage]
class StoryViewerRoute extends PageRouteInfo<StoryViewerRouteArgs> {
  StoryViewerRoute({
    required Story data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StoryViewerRoute.name,
          args: StoryViewerRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryViewerRoute';

  static const PageInfo<StoryViewerRouteArgs> page =
      PageInfo<StoryViewerRouteArgs>(name);
}

class StoryViewerRouteArgs {
  const StoryViewerRouteArgs({
    required this.data,
    this.key,
  });

  final Story data;

  final Key? key;

  @override
  String toString() {
    return 'StoryViewerRouteArgs{data: $data, key: $key}';
  }
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
