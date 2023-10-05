import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onChanged;

  const Navigation(
      {super.key, required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.people), label: 'Contacts'),
        NavigationDestination(icon: Icon(Icons.photo_filter), label: 'Stories'),
        NavigationDestination(icon: Icon(Icons.explore), label: 'Map'),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onChanged,
    );
  }
}
