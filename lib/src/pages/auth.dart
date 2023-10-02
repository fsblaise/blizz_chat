import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  switchPages() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLogin ? SignIn(registerPressed: switchPages) : SignUp());
  }
}

class SignIn extends StatelessWidget {
  final void Function() registerPressed;

  const SignIn({super.key, required this.registerPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Welcome back!'),
        const Text('Please log in to your account'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email),
            SizedBox(
                width: 350,
                child: TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(label: Text('Email address')),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock),
            SizedBox(
                width: 350,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(label: Text('Password')),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Not a member yet?'),
            TextButton(
                onPressed: changeToRegistration,
                child: const Text('Register now'))
          ],
        )
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  final void Function() registerPressed;

  const SignUp({super.key, required this.registerPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Welcome back!'),
        const Text('Please log in to your account'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email),
            SizedBox(
                width: 350,
                child: TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(label: Text('Email address')),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock),
            SizedBox(
                width: 350,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(label: Text('Password')),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Not a member yet?'),
            TextButton(
                onPressed: changeToRegistration,
                child: const Text('Register now'))
          ],
        )
      ],
    );
  }
}
