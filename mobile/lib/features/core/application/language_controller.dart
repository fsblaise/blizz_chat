import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_controller.g.dart';

@riverpod
class LanguageController extends _$LanguageController {
  @override
  Future<Locale?> build() async {
    String locale = '';
    final prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('language');
    print("build locale");

    if (language == null) {
      return null;
    } else {
      return Locale(language);
    }
  }

  Future<Locale> setLocale(Locale locale) async {
    state = AsyncValue.data(locale);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
    return locale;
  }
}
