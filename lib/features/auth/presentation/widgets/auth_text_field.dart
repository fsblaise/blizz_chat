import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.errorText,
    required this.initialValue,
    required this.onChanged,
  });

  final Icon icon;
  final String hint;
  final bool obscure;
  final String? errorText;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: obscure,
              onChanged: onChanged,
              initialValue: initialValue,
              decoration: InputDecoration(
                  errorText: errorText,
                  hintText: hint,
                  prefixIcon: icon,
                  border: const OutlineInputBorder(gapPadding: 5, borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ],
    );
  }
}
