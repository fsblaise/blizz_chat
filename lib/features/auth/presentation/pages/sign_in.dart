import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/button_expanded.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  final void Function() switchPressed;

  const SignIn({super.key, required this.switchPressed});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthRepository _auth;

  signIn() {
    _auth.signIn(emailController.text.trim(), passwordController.text.trim()).then((value) => {
          Navigator.pushAndRemoveUntil(
              context, CupertinoPageRoute(builder: (context) => const HomePage()), (route) => false)
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = ref.read(authRepositoryProvider);
  }

  @override
  Widget build(BuildContext context) {
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
            // AuthTextField(
            //     obscure: false,
            //     controller: emailController,
            //     onChanged: () {},
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter some text';
            //       }
            //       return null;
            //     },
            //     icon: const Icon(Icons.email),
            //     hint: 'Email address'),
            // AuthTextField(
            //     obscure: true,
            //     controller: passwordController,
            //     onChanged: () {},
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter some text';
            //       }
            //       return null;
            //     },
            //     icon: const Icon(Icons.lock),
            //     hint: 'Password'),
            ExpandedButton(
              onTap: signIn,
              text: 'Sign In',
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member yet?'),
                TextButton(onPressed: widget.switchPressed, child: const Text('Register now'))
              ],
            )
          ],
        )
      ],
    );
  }
}
