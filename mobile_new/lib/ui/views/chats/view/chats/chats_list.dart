import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsList extends StatefulWidget {
  ChatsList({
    required this.keyword,
    required this.chatsCubit,
    required this.resetSearch,
    required this.user,
    super.key,
  });
  late String keyword;
  final ChatsCubit chatsCubit;
  final void Function() resetSearch;
  final UserProfile? user;

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  List<Chat> chats = [];
  List<Chat> filteredChats = [];

  Future<void> _handleRefresh() async {
    await widget.chatsCubit.fetchChats();
    widget.keyword = '';
    widget.resetSearch();
  }

  void _filter() {
    if (widget.keyword.isNotEmpty) {
      filteredChats =
          chats.where((chat) => chat.title.contains(widget.keyword)).toList();
    } else {
      filteredChats = chats;
    }
  }

  void _launchMessaging(Chat chat) {}

  void _muteChat(Chat chat) {}

  void _leaveChat(Chat chat) {}

  Widget _renderList(ChatsFetched state) {
    chats = <Chat>[...state.chats];
    _filter();
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: filteredChats.length,
        itemBuilder: (context, index) {
          final isGroup = filteredChats[index].participants.length > 2;
          final title = isGroup
              ? filteredChats[index].title
              : filteredChats[index]
                  .participants
                  .firstWhere(
                    (participant) => participant.email != widget.user?.email,
                  )
                  .nickname;

          return ListTile(
            onTap: () => _launchMessaging(filteredChats[index]),
            onLongPress: () async {
              return getIt.get<DialogService>().showModalSheetDialog(context, [
                SheetButton(
                  onTap: () => _muteChat(filteredChats[index]),
                  iconData: Icons.notifications_off,
                  text: 'Mute',
                ),
                SheetButton(
                  onTap: () => _leaveChat(filteredChats[index]),
                  iconData: Icons.logout,
                  text: 'Leave Chat',
                ),
              ]);
            },
            leading: isGroup
                ? const CircleAvatar(
                    child: Icon(Icons.people),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
            title: Text(title),
            subtitle: filteredChats[index].lastMessage != null
                ? Text(filteredChats[index].lastMessage!)
                : null,
          );
        },
      ),
    );
  }

  Widget _renderEmpty() {
    return const Text('Add chats to start messaging.');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is ChatsFetched) {
          return _renderList(state);
        } else if (state is ChatsInitial) {
          return _renderEmpty();
        }
        return const LoadingWidget();
      },
    );
  }
}
