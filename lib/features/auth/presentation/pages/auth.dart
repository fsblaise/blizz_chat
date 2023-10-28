import 'package:blizz_chat/features/auth/presentation/pages/sign_in.dart';
import 'package:blizz_chat/features/auth/presentation/pages/sign_up.dart';
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
