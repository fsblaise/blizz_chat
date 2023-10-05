import 'package:blizz_chat/src/pages/home.dart';
import 'package:blizz_chat/src/widgets/auth_text_field.dart';
import 'package:blizz_chat/src/widgets/button_expanded.dart';
import 'package:flutter/cupertino.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
                child: isLogin
                    ? SignIn(switchPressed: switchForms)
                    : SignUp(
                        switchPressed: switchForms,
                      )),
          ));
        },
      )),
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
            ExpandedButton(
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final List<int> steps = [1, 2];
  int currentStep = 1;

  switchSteps() {
    setState(() {
      currentStep = 2;
    });
  }

  signUp() {
    setState(() {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 0),
            transitionBuilder: (child, animation) => SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(animation),
                child: child),
            child: currentStep == 1
                ? AuthStep(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    continueTap: switchSteps,
                    switchPressed: widget.switchPressed,
                  )
                : PersonalStep(
                    nameController: _nameController,
                    submitTap: signUp,
                  ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var step in steps)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.circle,
                  color: currentStep == step ? Colors.deepPurple : Colors.grey,
                  size: 16,
                ),
              )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class AuthStep extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function() continueTap;
  final Function() switchPressed;
  const AuthStep(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.continueTap,
      required this.switchPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Welcome newcomer!',
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
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
              ExpandedButton(
                onTap: continueTap,
                text: 'Continue',
              ),
              const SizedBox(width: 334, child: Divider(thickness: 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  TextButton(
                      onPressed: switchPressed, child: const Text('Login now'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class PersonalStep extends StatelessWidget {
  final TextEditingController nameController;
  final Function() submitTap;
  const PersonalStep(
      {super.key, required this.nameController, required this.submitTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Before using the app:\nWhat's your name?",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              AuthTextField(
                  obscure: false,
                  controller: nameController,
                  icon: const Icon(Icons.email),
                  hint: 'Full Name'),
              ExpandedButton(onTap: submitTap, text: 'Sign Up')
            ],
          )
        ],
      ),
    );
  }
}
