import 'package:flutter/material.dart';

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
