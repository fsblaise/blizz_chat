import 'package:blizz_chat/features/auth/presentation/pages/auth.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final I10n _i10n = locator<I10n>();

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            _i10n.appName,
            style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            _i10n.premise,
            style: const TextStyle(fontSize: 26),
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
                style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(120, 40))),
                child: Text(_i10n.continueBtn),
              ),
            ],
          )
        ],
      ),
    );
  }
}
