import 'package:blizz_chat/src/pages/contacts.dart';
import 'package:blizz_chat/src/pages/home.dart';
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
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: GoogleFonts.inter().fontFamily),
      home: isLoggedIn ? const HomePage() : const Scaffold(body: WelcomePage()),
    );
  }
}
