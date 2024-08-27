import 'package:auto_route/annotations.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/chats/view/chats/add_chat.dart';
import 'package:blizz_chat/ui/views/chats/view/chats/chats_list.dart';
import 'package:blizz_chat/ui/views/chats/view/users/add_user.dart';
import 'package:blizz_chat/ui/views/chats/view/users/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Segments { chats, contacts }

@RoutePage()
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  String _keyword = '';
  Segments selected = Segments.chats;
  bool isAdd = false;
  final TextEditingController _searchController = TextEditingController();
  late final UsersCubit _usersCubit;
  late final ChatsCubit _chatsCubit;

  @override
  void initState() {
    super.initState();
    // Prefetching data to optimize api calling
    _usersCubit = context.read<UsersCubit>();
    _usersCubit.fetchContacts();
    _chatsCubit = context.read<ChatsCubit>();
    _chatsCubit.fetchChats();
  }

  void _resetSearch() {
    _keyword = '';
    _searchController.clear();
  }

  void _toggleAdd() {
    setState(() {
      isAdd = !isAdd;
      _keyword = '';
      _searchController.clear();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _search(String value) {
    setState(() {
      _keyword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selected == Segments.chats
          ? FloatingActionButton(
              onPressed: _toggleAdd,
              child: isAdd
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.add_comment),
            )
          : FloatingActionButton(
              onPressed: _toggleAdd,
              child: isAdd
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.person_add),
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            SearchBarWidget(
              searchController: _searchController,
              fn: _search,
            ),
            const SizedBox(height: 15),
            if (!isAdd)
              SegmentedButton(
                segments: const [
                  ButtonSegment(value: Segments.chats, label: Text('Chats')),
                  ButtonSegment(
                    value: Segments.contacts,
                    label: Text('Contacts'),
                  ),
                ],
                selected: {
                  selected,
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
                  visualDensity: VisualDensity.compact,
                ),
              ),
            const SizedBox(height: 15),
            Expanded(
              child: switch (selected) {
                Segments.chats => isAdd
                    ? AddChat(
                        keyword: _keyword,
                        usersCubit: _usersCubit,
                        chatsCubit: _chatsCubit,
                      )
                    : ChatsList(keyword: _keyword),
                Segments.contacts => isAdd
                    ? AddUser(
                        keyword: _keyword,
                        callback: _toggleAdd,
                      )
                    : UsersList(
                        keyword: _keyword,
                        usersCubit: _usersCubit,
                        resetSearch: _resetSearch,
                      ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
