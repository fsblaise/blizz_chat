import 'package:blizz_chat/src/pages/contacts.dart';
import 'package:blizz_chat/src/pages/map.dart';
import 'package:blizz_chat/src/pages/stories.dart';
import 'package:blizz_chat/src/services/auth_service.dart';
import 'package:blizz_chat/src/widgets/navigation.dart';
import 'package:blizz_chat/src/widgets/settings_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int selectedPage = 0;
  final AuthService auth = AuthService();

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
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
          actions: [SettingsSheet(auth: auth)],
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
