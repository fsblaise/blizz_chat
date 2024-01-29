import 'package:blizz_chat/features/auth/presentation/pages/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.chat,
            size: 169,
            color: Colors.deepPurple,
          ),
          Text(
            localization.or,
            style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'End-to-end instant messaging for everyone',
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const AuthPage()));
                },
                child: const Text('Continue'),
                style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(120, 40))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
