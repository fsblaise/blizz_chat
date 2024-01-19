import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  ProfileWidget({super.key});
  bool switchVal = false;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
              radius: 42,
            ),
            Text('Name')
          ],
        ),
        Row(
          children: [
            Switch(
                value: widget.switchVal,
                onChanged: (bool val) {
                  setState(() {
                    widget.switchVal = val;
                  });
                }),
            Text('Toggle things')
          ],
        )
      ],
    );
  }
}
