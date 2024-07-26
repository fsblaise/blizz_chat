import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({required this.onTap, required this.text, super.key});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FilledButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
