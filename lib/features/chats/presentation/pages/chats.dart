import 'package:blizz_chat/features/chats/presentation/widgets/my_chats.dart';
import 'package:blizz_chat/features/chats/application/chats_controller.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/add_chats.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/my_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Segments { my, add }

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

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  String _keyword = '';
  Segments selected = Segments.my;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                decoration:
                    const InputDecoration(hintText: 'Search', border: InputBorder.none, prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SegmentedButton(
              segments: const [
                ButtonSegment(value: Segments.my, label: Text('My chats')),
                ButtonSegment(value: Segments.add, label: Text('Add new contacts'))
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
          selected == Segments.my ? MyChatsWidget(keyword: _keyword) : AddChatsWidget(keyword: _keyword)
        ],
      ),
    );
  }
}
