import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/contacts/presentation/pages/contacts.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:blizz_chat/features/map/presentation/pages/map.dart';
import 'package:blizz_chat/features/stories/presentation/pages/stories.dart';
import 'package:blizz_chat/features/core/presentation/pages/welcome.dart';
import 'package:blizz_chat/features/core/presentation/services/auth_service.dart';
import 'package:blizz_chat/features/core/presentation/widgets/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  User? user;
  late AuthRepository _auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = ref.read(authRepositoryProvider);
    user = _auth.getLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: GoogleFonts.inter().fontFamily),
        home: user != null ? const HomePage() : const WelcomePage());
  }
}
