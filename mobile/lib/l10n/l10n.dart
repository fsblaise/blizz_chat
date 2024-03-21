import 'dart:ui';

import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';

final I10n _i10n = locator<I10n>();

class L10nUtils {
  static final all = [const Locale('en'), const Locale('hu')];

  static String getLanguage(String locale) {
    switch (locale) {
      case 'en':
        return _i10n.en;
      case 'hu':
        return _i10n.hu;
      default:
        return _i10n.en;
    }
  }
}
