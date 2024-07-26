import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.errorText,
    required this.onChanged,
    required this.controller,
    super.key,
  });

  final Icon icon;
  final String hint;
  final bool obscure;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              obscureText: obscure,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: hint,
                prefixIcon: icon,
                border: const OutlineInputBorder(
                  gapPadding: 5,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
