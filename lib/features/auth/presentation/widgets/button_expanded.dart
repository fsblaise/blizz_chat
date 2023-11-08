import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final dynamic onTap;
  final String text;

  const ExpandedButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
