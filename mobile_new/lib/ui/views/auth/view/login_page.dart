import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({this.email, super.key});
  final String? email;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    if (widget.email != null && widget.email!.isNotEmpty) {
      _emailController.text = widget.email!;
    }
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginFormCubit, LoginFormState>(
        builder: (context, state) {
          if (_emailController.text.isNotEmpty) {
            context.read<LoginFormCubit>().updateEmail(_emailController.text);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Please log in',
                    style: TextStyle(fontSize: 20),
                  ),
                  AuthTextField(
                    obscure: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: context.read<LoginFormCubit>().updateEmail,
                    errorText: state.emailError,
                    icon: const Icon(Icons.email),
                    hint: 'Email Address',
                  ),
                  AuthTextField(
                    obscure: true,
                    controller: _passwordController,
                    onChanged: context.read<LoginFormCubit>().updatePassword,
                    errorText: state.passwordError,
                    icon: const Icon(Icons.lock),
                    hint: 'Password',
                  ),
                  ExpandedButton(
                    onTap: state.isValid
                        ? () => context
                            .read<AuthCubit>()
                            .signIn(state.email, state.password)
                        : null,
                    text: 'Sign In',
                  ),
                  const SizedBox(width: 334, child: Divider(thickness: 1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member yet?'),
                      TextButton(
                        onPressed: () {
                          context.router.replace(
                              RegisterRoute(email: _emailController.text));
                        },
                        child: const Text('Register now'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
