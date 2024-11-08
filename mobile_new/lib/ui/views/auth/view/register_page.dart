import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({this.email, super.key});
  final String? email;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<int> steps = [1, 2];
  int currentStep = 1;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  late final TextEditingController _fullNameController;

  void _switchSteps() {
    setState(() {
      if (currentStep == 2) {
        currentStep = 1;
      } else {
        currentStep = 2;
      }
    });
  }

  void _register(BuildContext context, RegisterFormState state) {
    context
        .read<AuthCubit>()
        .signUp(state.email, state.password, state.fullName);
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    if (widget.email != null && widget.email!.isNotEmpty) {
      _emailController.text = widget.email!;
    }
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterFormCubit, RegisterFormState>(
        builder: (context, state) {
          if (_emailController.text.isNotEmpty) {
            context.read<LoginFormCubit>().updateEmail(_emailController.text);
          }
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, viewportConstraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentStep == 2)
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: IconButton(
                              onPressed: _switchSteps,
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            reverseDuration: Duration.zero,
                            transitionBuilder: (child, animation) =>
                                SlideTransition(
                              position: currentStep == 2
                                  ? Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(animation)
                                  : Tween<Offset>(
                                      begin: const Offset(-1, 0),
                                      end: Offset.zero,
                                    ).animate(animation),
                              child: child,
                            ),
                            child: currentStep == 1
                                ? StepOne(
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                    rePasswordController: _rePasswordController,
                                    state: state,
                                    switchSteps: _switchSteps,
                                  )
                                : StepTwo(
                                    fullNameController: _fullNameController,
                                    state: state,
                                    switchSteps: _switchSteps,
                                    register: _register,
                                  ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final step in steps)
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.circle,
                                  color: currentStep == step
                                      ? Colors.deepPurple
                                      : Colors.grey,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  const StepOne({
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.state,
    required this.switchSteps,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final RegisterFormState state;
  final void Function() switchSteps;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
          children: [
            Text(
              'Welcome newcomer',
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'Please register an account',
              style: TextStyle(fontSize: 20),
            ),
            AuthTextField(
              obscure: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: context.read<RegisterFormCubit>().updateEmail,
              errorText: state.emailError,
              icon: const Icon(Icons.email),
              hint: 'Email Address',
            ),
            AuthTextField(
              obscure: true,
              controller: passwordController,
              onChanged: context.read<RegisterFormCubit>().updatePassword,
              errorText: state.passwordError,
              icon: const Icon(Icons.lock),
              hint: 'Password',
            ),
            AuthTextField(
              obscure: true,
              controller: rePasswordController,
              onChanged: context.read<RegisterFormCubit>().updateRePassword,
              errorText: state.rePasswordError,
              icon: const Icon(Icons.lock),
              hint: 'Confirm Password',
            ),
            ExpandedButton(
              onTap: state.isStepOneValid ? switchSteps : null,
              text: 'Continue',
            ),
            const SizedBox(width: 334, child: Divider(thickness: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                TextButton(
                  onPressed: () {
                    context.router
                        .replace(LoginRoute(email: emailController.text));
                  },
                  child: const Text('Login now'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({
    required this.fullNameController,
    required this.state,
    required this.switchSteps,
    required this.register,
    super.key,
  });
  final TextEditingController fullNameController;
  final RegisterFormState state;
  final void Function() switchSteps;
  final void Function(BuildContext, RegisterFormState) register;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
          children: [
            Text(
              "What's your name?",
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            AuthTextField(
              obscure: false,
              controller: fullNameController,
              onChanged: context.read<RegisterFormCubit>().updateFullName,
              errorText: state.fullNameError,
              icon: const Icon(Icons.lock),
              hint: 'Full Name',
            ),
            ExpandedButton(
              onTap: state.isValid ? () => register(context, state) : null,
              text: 'Continue',
            ),
          ],
        ),
      ],
    );
  }
}
