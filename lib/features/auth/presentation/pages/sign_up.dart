import 'package:blizz_chat/features/auth/application/sign_up_controller.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/button_expanded.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  final void Function() switchPressed;

  const SignUp({super.key, required this.switchPressed});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final List<int> steps = [1, 2];
  int currentStep = 1;

  late AuthRepository _auth;

  @override
  void initState() {
    super.initState();

    _auth = ref.read(authRepositoryProvider);
  }

  switchSteps() {
    setState(() {
      if (currentStep == 2) {
        currentStep = 1;
      } else {
        currentStep = 2;
      }
    });
  }

  signUp() {
    print('signup');
    // String password = _passwordController.text.trim();
    // String confirmPassword = _confirmPasswordController.text.trim();
    // if (password == confirmPassword && _signUpKey.currentState!.validate()) {
    //   FbUser user = FbUser(_emailController.text.trim(), DateTime.now().toIso8601String(), _nameController.text.trim());
    //   // print('successful signup');
    //   // print(user.fullName);
    //   // print(user.email);
    //   // print(user.created);
    //   _auth.signUp(user, password).then((value) => {
    //         // print("Hello"),
    //         Navigator.pushAndRemoveUntil(
    //             context, CupertinoPageRoute(builder: (context) => const HomePage()), (route) => false)
    //       });
    // }
    // setState(() {
    //   Navigator.push(
    //       context, CupertinoPageRoute(builder: (context) => const HomePage()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    final signUpForm = ref.watch(signUpControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (currentStep == 2)
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: IconButton(onPressed: switchSteps, icon: const Icon(Icons.arrow_back)),
          ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 0),
            transitionBuilder: (child, animation) => SlideTransition(
                position: currentStep == 2
                    ? Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation)
                    : Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
                child: child),
            child: currentStep == 1
                ? AuthStep(
                    continueTap: switchSteps,
                    signUpForm: signUpForm,
                    switchPressed: widget.switchPressed,
                  )
                : PersonalStep(
                    signUpForm: signUpForm,
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

class AuthStep extends ConsumerWidget {
  final dynamic continueTap;
  final Function() switchPressed;
  final SignUpForm signUpForm;
  const AuthStep({super.key, required this.continueTap, required this.switchPressed, required this.signUpForm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  initialValue: signUpForm.email,
                  onChanged: ref.read(signUpControllerProvider.notifier).updateEmail,
                  errorText: signUpForm.emailErrorText,
                  icon: const Icon(Icons.email),
                  hint: 'Email address'),
              AuthTextField(
                  obscure: true,
                  initialValue: signUpForm.password,
                  onChanged: ref.read(signUpControllerProvider.notifier).updatePassword,
                  errorText: signUpForm.passwordErrorText,
                  icon: const Icon(Icons.lock),
                  hint: 'Password'),
              AuthTextField(
                  obscure: true,
                  initialValue: signUpForm.confirmPassword,
                  onChanged: ref.read(signUpControllerProvider.notifier).updateConfirmPassword,
                  errorText: signUpForm.confirmPasswordErrorText,
                  icon: const Icon(Icons.lock),
                  hint: 'Confirm password'),
              ExpandedButton(
                onTap: signUpForm.isAuthStepValid ? continueTap : null,
                text: 'Continue',
              ),
              const SizedBox(width: 334, child: Divider(thickness: 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  TextButton(onPressed: switchPressed, child: const Text('Login now'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class PersonalStep extends ConsumerWidget {
  final dynamic submitTap;
  final SignUpForm signUpForm;
  const PersonalStep({super.key, required this.submitTap, required this.signUpForm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  initialValue: signUpForm.name,
                  onChanged: ref.read(signUpControllerProvider.notifier).updateName,
                  errorText: signUpForm.nameErrorText,
                  icon: const Icon(Icons.person),
                  hint: 'Full Name'),
              ExpandedButton(onTap: signUpForm.isValid ? submitTap : null, text: 'Sign Up')
            ],
          )
        ],
      ),
    );
  }
}
