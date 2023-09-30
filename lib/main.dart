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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: GoogleFonts.inter().fontFamily),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Blizz Chat'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.chat,
              size: 200,
            ),
            Text(
              'Blizz Chat',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'End-to-end instant messaging for everyone',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
