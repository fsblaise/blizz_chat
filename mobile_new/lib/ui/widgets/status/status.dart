import 'package:flutter/material.dart';

class StatusDot extends StatelessWidget {
  const StatusDot({
    required this.isOnline,
    super.key,
  });
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isOnline ? Colors.green : Colors.red,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }
}
