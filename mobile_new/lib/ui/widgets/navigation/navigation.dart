import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });
  final int selectedIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline_outlined),
          selectedIcon: Icon(Icons.chat_bubble),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Icon(Icons.web_stories_outlined),
          selectedIcon: Icon(Icons.web_stories),
          label: 'Stories',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: 'Map',
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onChanged,
    );
  }
}
