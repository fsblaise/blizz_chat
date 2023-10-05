import 'package:blizz_chat/src/pages/contacts.dart';
import 'package:blizz_chat/src/pages/map.dart';
import 'package:blizz_chat/src/pages/settings.dart';
import 'package:blizz_chat/src/pages/stories.dart';
import 'package:blizz_chat/src/widgets/navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int selectedPage = 0;

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Contacts', 'Stories', 'Map'][selectedPage]),
        automaticallyImplyLeading: false,
      ),
      body: [
        SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: const ContactsPage(),
          ),
        ),
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
      bottomNavigationBar:
          Navigation(selectedIndex: selectedPage, onChanged: onPageChanged),
    );
  }
}
