import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:blizz_chat/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/firebase_options.dart';

final I10n _i10n = locator<I10n>();

void main() async {
  await dotenv.load(fileName: '.env.dev');
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
}
