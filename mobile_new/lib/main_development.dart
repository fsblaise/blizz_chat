import 'package:blizz_chat/app/app.dart';
import 'package:blizz_chat/bootstrap.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.dev');
  await configureDependencies();
  await bootstrap(() => const App());
}
