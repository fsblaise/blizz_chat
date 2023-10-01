import 'package:blizz_chat/src/pages/contacts.dart';
import 'package:blizz_chat/src/pages/map.dart';
import 'package:blizz_chat/src/pages/settings.dart';
import 'package:blizz_chat/src/pages/stories.dart';
import 'package:blizz_chat/src/pages/welcome.dart';
import 'package:blizz_chat/src/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedPage = 0;
  bool isLoggedIn = false;

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: GoogleFonts.inter().fontFamily),
      home: Scaffold(
        body: isLoggedIn
            ? [
                Container(
                  alignment: Alignment.center,
                  child: const ContactsPage(),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const StoriesPage(),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const MapPage(),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const SettingsPage(),
                ),
              ][selectedPage]
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomePage(),
                  TextButton(onPressed: login, child: const Text('test login'))
                ],
              ),
        bottomNavigationBar: isLoggedIn
            ? Navigation(selectedIndex: selectedPage, onChanged: onPageChanged)
            : null,
      ),
    );
  }
}
