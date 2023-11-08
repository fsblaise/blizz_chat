import 'package:blizz_chat/features/auth/application/sign_in_controller.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/button_expanded.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('Failed to sign in')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInForm = ref.watch(signInControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'Please log in to your account',
              style: TextStyle(fontSize: 18),
            ),
            AuthTextField(
                obscure: false,
                initialValue: signInForm.email,
                onChanged: ref.read(signInControllerProvider.notifier).updateEmail,
                errorText: signInForm.emailErrorText,
                icon: const Icon(Icons.email),
                hint: 'Email address'),
            AuthTextField(
                obscure: true,
                initialValue: signInForm.password,
                onChanged: ref.read(signInControllerProvider.notifier).updatePassword,
                errorText: signInForm.passwordErrorText,
                icon: const Icon(Icons.lock),
                hint: 'Password'),
            ExpandedButton(
              onTap: signInForm.isValid ? () => _signIn(context, ref) : null,
              text: 'Sign In',
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member yet?'),
                TextButton(onPressed: switchPressed, child: const Text('Register now'))
              ],
            )
          ],
        )
      ],
    );
  }
}
