import 'package:blizz_chat/features/chats/infrastructure/chats_provider.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/my_contacts.dart';
import 'package:blizz_chat/features/chats/application/chats_controller.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/add_contacts.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/my_contacts.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/my_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Segments { chats, contacts, add }

// List<String> _contacts = [
//   'Contact1',
//   'Contact2',
//   'Contact3',
//   'Contact4',
//   'Contact5',
//   'Contact6',
//   'Contact7',
//   'Contact8',
//   'Contact9',
//   'Contact10',
//   'Contact11',
//   'Contact12'
// ];

class ChatsPage extends ConsumerStatefulWidget {
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  String _keyword = '';
  Segments selected = Segments.chats;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(150, 150, 150, 0.2),
                ),
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (value) => setState(() {
                    _keyword = value;
                  }),
                  decoration: const InputDecoration(
                      hintText: 'Search', border: InputBorder.none, prefixIcon: Icon(Icons.search)),
                ),
              ),
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
