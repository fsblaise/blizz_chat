import 'package:flutter/material.dart';

class AddChat extends StatefulWidget {
  const AddChat({required this.keyword, super.key});
  final String keyword;

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  @override
  Widget build(BuildContext context) {
    return const Text('add chat');
  }
}
