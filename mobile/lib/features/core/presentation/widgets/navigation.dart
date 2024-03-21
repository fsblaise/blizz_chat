import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';

final I10n _i10n = locator<I10n>();

class Navigation extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onChanged;

  const Navigation({super.key, required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
            icon: const Icon(Icons.chat_bubble_outline_outlined),
            selectedIcon: const Icon(Icons.chat_bubble),
            label: _i10n.chats),
        NavigationDestination(
            icon: const Icon(Icons.web_stories_outlined),
            selectedIcon: const Icon(Icons.web_stories),
            label: _i10n.stories),
        NavigationDestination(
            icon: const Icon(Icons.explore_outlined), selectedIcon: const Icon(Icons.explore), label: _i10n.map),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onChanged,
    );
  }
}
