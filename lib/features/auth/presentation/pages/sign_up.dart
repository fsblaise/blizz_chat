import 'package:blizz_chat/features/auth/application/sign_up_controller.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blizz_chat/features/auth/presentation/widgets/button_expanded.dart';
import 'package:blizz_chat/features/core/presentation/pages/home.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class SignUp extends ConsumerStatefulWidget {
  final void Function() switchPressed;

  const SignUp({super.key, required this.switchPressed});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final List<int> steps = [1, 2];
  int currentStep = 1;

  switchSteps() {
    setState(() {
      if (currentStep == 2) {
        currentStep = 1;
      } else {
        currentStep = 2;
      }
    });
  }

  _signUp() async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final signUpController = ref.read(signUpControllerProvider.notifier);
    try {
      final user = await signUpController.signUp();
      Navigator.pushAndRemoveUntil(
          context, CupertinoPageRoute(builder: (context) => const HomePage()), (route) => false);
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(_i10n.failedToSignUp)));
    }
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
                    submitTap: _signUp,
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
          Text(
            _i10n.welcomeNew,
            style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Text(
                _i10n.pleaseRegister,
                style: const TextStyle(fontSize: 18),
              ),
              AuthTextField(
                  obscure: false,
                  initialValue: signUpForm.email,
                  onChanged: ref.read(signUpControllerProvider.notifier).updateEmail,
                  errorText: signUpForm.emailErrorText,
                  icon: const Icon(Icons.email),
                  hint: _i10n.emailAddress),
              AuthTextField(
                  obscure: true,
                  initialValue: signUpForm.password,
                  onChanged: ref.read(signUpControllerProvider.notifier).updatePassword,
                  errorText: signUpForm.passwordErrorText,
                  icon: const Icon(Icons.lock),
                  hint: _i10n.password),
              AuthTextField(
                  obscure: true,
                  initialValue: signUpForm.confirmPassword,
                  onChanged: ref.read(signUpControllerProvider.notifier).updateConfirmPassword,
                  errorText: signUpForm.confirmPasswordErrorText,
                  icon: const Icon(Icons.lock),
                  hint: _i10n.confirmPassword),
              ExpandedButton(
                onTap: signUpForm.isAuthStepValid ? continueTap : null,
                text: _i10n.continueBtn,
              ),
              const SizedBox(width: 334, child: Divider(thickness: 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_i10n.alreadyMember),
                  TextButton(onPressed: switchPressed, child: Text(_i10n.loginNow))
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
          Text(
            _i10n.personalStep1,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                  hint: _i10n.fullName),
              ExpandedButton(onTap: signUpForm.isValid ? submitTap : null, text: _i10n.signUp)
            ],
          )
        ],
      ),
    );
  }
}
