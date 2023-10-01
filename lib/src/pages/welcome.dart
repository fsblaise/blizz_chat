import 'package:blizz_chat/src/pages/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.chat,
          size: 200,
          color: Colors.deepPurple,
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Blizz Chat',
          style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'End-to-end instant messaging for everyone',
          style: TextStyle(fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const AuthPage()));
              },
              child: const Text('Continue'),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(150, 60))),
            ),
          ],
        )
      ],
    );
  }
}
