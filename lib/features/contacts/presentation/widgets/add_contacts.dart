import 'package:flutter/material.dart';

class AddContactsWidget extends StatelessWidget {
  final String keyword;
  const AddContactsWidget({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text('Use the search field to find new contacts'), Text(keyword)],
    );
  }
}
