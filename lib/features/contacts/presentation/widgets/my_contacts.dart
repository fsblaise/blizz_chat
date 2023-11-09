import 'package:flutter/material.dart';

class MyContactsWidget extends StatelessWidget {
  final List<String> contacts;
  const MyContactsWidget({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: contacts
            .map((contact) => ListTile(
                  title: Text(contact),
                ))
            .toList());
  }
}
