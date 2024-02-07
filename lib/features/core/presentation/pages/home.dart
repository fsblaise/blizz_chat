import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/chats/presentation/pages/chats.dart';
import 'package:blizz_chat/features/core/application/language_controller.dart';
import 'package:blizz_chat/features/core/application/user_controller.dart';
import 'package:blizz_chat/features/map/presentation/pages/map.dart';
import 'package:blizz_chat/features/stories/presentation/pages/stories.dart';
import 'package:blizz_chat/features/core/presentation/widgets/navigation.dart';
import 'package:blizz_chat/features/core/presentation/widgets/settings_sheet.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  int selectedPage = 0;
  List<int> prevPages = [];
  late AuthRepository _auth;

  void onPageChanged(int index) {
    if (selectedPage == index) return;
    setState(() {
      prevPages.add(selectedPage);
      selectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _auth = ref.read(authRepositoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userControllerProvider);
    // fetch the user's location every time, the app is opened, and the home page is initialized
    ref.watch(locationProvider);
    ref.watch(languageControllerProvider);
    return WillPopScope(
      onWillPop: () async {
        if (prevPages.isNotEmpty) {
          setState(() {
            selectedPage = prevPages.removeLast();
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text([_i10n.chats, _i10n.stories, _i10n.map][selectedPage]),
          automaticallyImplyLeading: false,
          actions: [SettingsSheet(auth: _auth)],
        ),
        body: [
          const ChatsPage(),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: const StoriesPage(),
            ),
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: const MapPage(),
            ),
          ),
        ][selectedPage],
        bottomNavigationBar: Navigation(selectedIndex: selectedPage, onChanged: onPageChanged),
      ),
    );
  }
}
