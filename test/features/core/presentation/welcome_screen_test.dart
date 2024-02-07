import 'package:blizz_chat/features/core/presentation/pages/welcome.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    setupLocator();
  });

  group('WelcomeScreen', () {
    testWidgets('shows title correctly', (widgetTester) async {
      final I10n _i10n = locator<I10n>();

      await widgetTester.pumpWidget(
        const MaterialApp(
          home: WelcomePage(),
        ),
      );

      await widgetTester.pump();
      await widgetTester.pump();

      // Perform your assertions here
      expect(find.text(_i10n.appName), findsOneWidget);
    });
  });
}
