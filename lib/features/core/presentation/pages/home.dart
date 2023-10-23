import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/contacts/presentation/pages/contacts.dart';
import 'package:blizz_chat/features/map/presentation/pages/map.dart';
import 'package:blizz_chat/features/stories/presentation/pages/stories.dart';
import 'package:blizz_chat/features/core/presentation/services/auth_service.dart';
import 'package:blizz_chat/features/core/presentation/widgets/navigation.dart';
import 'package:blizz_chat/features/core/presentation/widgets/settings_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  int selectedPage = 0;
  late AuthRepository _auth;

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = ref.read(authRepositoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedPage != 0) {
          onPageChanged(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(['Contacts', 'Stories', 'Map'][selectedPage]),
          automaticallyImplyLeading: false,
          actions: [SettingsSheet(auth: _auth)],
        ),
        body: [
          const ContactsPage(),
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
