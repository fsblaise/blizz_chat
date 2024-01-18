import 'package:blizz_chat/features/chats/presentation/widgets/my_contacts.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/add_contacts.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/my_chats.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/new_message.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Segments { chats, contacts, add }

class ChatsPage extends ConsumerStatefulWidget {
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  String _keyword = '';
  Segments selected = Segments.chats;
  final TextEditingController _searchController = TextEditingController();

  _openNewMessage() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => const NewMessagePage()));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  _search(String value) {
    setState(() {
      _keyword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selected == Segments.chats
          ? FloatingActionButton(
              onPressed: _openNewMessage,
              child: const Icon(Icons.message),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBarWidget(
              searchController: _searchController,
              fn: _search,
            ),
            const SizedBox(
              height: 15,
            ),
            SegmentedButton(
                segments: const [
                  ButtonSegment(value: Segments.chats, label: Text('Chats')),
                  ButtonSegment(value: Segments.contacts, label: Text('Contacts')),
                  ButtonSegment(value: Segments.add, label: Text('Add'))
                ],
                selected: {
                  selected
                },
                showSelectedIcon: false,
                onSelectionChanged: (Set<Segments> selection) {
                  setState(() {
                    selected = selection.first;
                    _keyword = '';
                    _searchController.clear();
                  });
                },
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                )),
            const SizedBox(
              height: 15,
            ),
            switch (selected) {
              Segments.chats => MyChatsWidget(keyword: _keyword),
              Segments.contacts => MyContactsWidget(keyword: _keyword),
              Segments.add => AddChatsWidget(keyword: _keyword),
            }
          ],
        ),
      ),
    );
  }
}
