import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/core/application/language_controller.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:blizz_chat/features/core/presentation/pages/welcome.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/l10n/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/firebase_options.dart';

final I10n _i10n = locator<I10n>();

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageControllerProvider);
    return lang.when(
        data: (locale) => MaterialApp(
            darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
                fontFamily: GoogleFonts.inter().fontFamily),
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                fontFamily: GoogleFonts.inter().fontFamily),
            locale: locale,
            localizationsDelegates: const [
              I10n.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: L10nUtils.all,
            themeMode: ThemeMode.system,
            home: const AuthWidget()),
        error: (e, s) => Center(child: Text(_i10n.somethingWentWrong)),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider);

    return user.when(data: (user) {
      if (user != null) {
        return const HomePage();
      } else {
        return const WelcomePage();
      }
    }, error: (e, s) {
      return const WelcomePage();
    }, loading: () {
      return const Scaffold(
        body: SafeArea(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      );
    });
  }
}
