import 'package:blizz_chat/app/app.dart';
import 'package:blizz_chat/bootstrap.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await bootstrap(() => const App());
}
