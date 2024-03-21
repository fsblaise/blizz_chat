import 'package:blizz_chat/features/auth/application/sign_in_controller.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/button_expanded.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class SignIn extends ConsumerWidget {
  final void Function() switchPressed;

  const SignIn({super.key, required this.switchPressed});

  _signIn(BuildContext context, WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final signInController = ref.read(signInControllerProvider.notifier);
    try {
      final user = await signInController.signIn();
      Navigator.pushAndRemoveUntil(
          context, CupertinoPageRoute(builder: (context) => const HomePage()), (route) => false);
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(_i10n.failedToSignIn)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInForm = ref.watch(signInControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              _i10n.welcomeBack,
              style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              _i10n.pleaseLogIn,
              style: const TextStyle(fontSize: 18),
            ),
            AuthTextField(
                obscure: false,
                initialValue: signInForm.email,
                onChanged: ref.read(signInControllerProvider.notifier).updateEmail,
                errorText: signInForm.emailErrorText,
                icon: const Icon(Icons.email),
                hint: _i10n.emailAddress),
            AuthTextField(
                obscure: true,
                initialValue: signInForm.password,
                onChanged: ref.read(signInControllerProvider.notifier).updatePassword,
                errorText: signInForm.passwordErrorText,
                icon: const Icon(Icons.lock),
                hint: _i10n.password),
            ExpandedButton(
              onTap: signInForm.isValid ? () => _signIn(context, ref) : null,
              text: _i10n.signIn,
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_i10n.notMemberYet),
                TextButton(onPressed: switchPressed, child: Text(_i10n.registerNow))
              ],
            )
          ],
        )
      ],
    );
  }
}
