import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  switchForms() {
    setState(() {
      isLogin = !isLogin;
      print('pressed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLogin
          ? SignIn(switchPressed: switchForms)
          : SignUp(
              switchPressed: switchForms,
            ),
    );
  }
}

class SignIn extends StatefulWidget {
  final void Function() switchPressed;

  const SignIn({super.key, required this.switchPressed});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() {}

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
            AuthTextField(
                obscure: false,
                controller: emailController,
                icon: const Icon(Icons.email),
                hint: 'Email address'),
            AuthTextField(
                obscure: true,
                controller: passwordController,
                icon: const Icon(Icons.lock),
                hint: 'Password'),
            FormButton(
              onTap: signIn,
              text: 'Sign In',
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member yet?'),
                TextButton(
                    onPressed: widget.switchPressed,
                    child: const Text('Register now'))
              ],
            )
          ],
        )
      ],
    );
  }
}

class SignUp extends StatefulWidget {
  final void Function() switchPressed;

  const SignUp({super.key, required this.switchPressed});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  signUp() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          children: [
            Text(
              'Welcome newcomer!',
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
        Column(
          children: [
            const Text(
              'Please register an account',
              style: TextStyle(fontSize: 18),
            ),
            AuthTextField(
                obscure: false,
                controller: emailController,
                icon: const Icon(Icons.email),
                hint: 'Email address'),
            AuthTextField(
                obscure: true,
                controller: passwordController,
                icon: const Icon(Icons.lock),
                hint: 'Password'),
            AuthTextField(
                obscure: true,
                controller: confirmPasswordController,
                icon: const Icon(Icons.lock),
                hint: 'Confirm password'),
            FormButton(
              onTap: signUp,
              text: 'Sign Up',
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                TextButton(
                    onPressed: widget.switchPressed,
                    child: const Text('Login now'))
              ],
            )
          ],
        )
      ],
    );
  }
}

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    required this.obscure,
  });

  final TextEditingController controller;
  final Icon icon;
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: obscure,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  prefixIcon: icon,
                  border: const OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ],
    );
  }
}

class FormButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const FormButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
