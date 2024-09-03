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
    required this.authCubit,
    super.key,
  });
  late String keyword;
  final ChatsCubit chatsCubit;
  final void Function() resetSearch;
  final AuthCubit authCubit;

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

  void _launchMessaging(Chat chat) {
    print(chat.id);
  }

  void _muteChat(Chat chat) {}

  Future<void> _leaveChat(Chat chat, String title) async {
    final user = widget.authCubit.getCurrentUser();
    if (user != null) {
      final isConfirm = await getIt.get<DialogService>().showConfirmDialog(
            context,
            title: 'Leave chat',
            text: 'Are you sure that you want to leave $title?',
          );
      print(isConfirm);
      if (isConfirm == null || !isConfirm) {
        return;
      }
      final updatedParticipants = List<Participant>.from(chat.participants)
        ..removeWhere((participant) => participant.email == user.email);
      final updatedChat = chat.copyWith(participants: updatedParticipants);

      await widget.chatsCubit.leaveChat(updatedChat);
      setState(() {});
    }
  }

  Future<void> _renameChat(Chat chat) async {
    final title = await getIt.get<DialogService>().showInputDialog(
          context,
          title: 'Rename Chat',
        );
    print(title);
    if (title == null) {
      return;
    }
    await widget.chatsCubit.renameChat(
      Chat(
        id: chat.id,
        title: title,
        lastMessage: chat.lastMessage,
        participants: chat.participants,
      ),
    );
    setState(() {});
  }

  Future<void> _renameContact(Contact contact) async {
    final name = await getIt.get<DialogService>().showInputDialog(
          context,
          title: 'Set Nickname',
        );
    print(name);
    if (name == null) {
      return;
    }
    await widget.authCubit.renameContact(
      Contact(
        nickname: name,
        fullName: contact.fullName,
        email: contact.email,
      ),
    );
    setState(() {});
  }

  Widget _renderList(ChatsFetched state) {
    final user = widget.authCubit.getCurrentUser();
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

          final notUserParticipants = filteredChats[index].participants.where(
                (participant) => participant.email != user?.email,
              );

          final contacts = !isGroup && notUserParticipants.isNotEmpty
              ? user!.contacts.where(
                  (contact) => contact.email == notUserParticipants.first.email,
                )
              : null;

          final contact =
              contacts != null && contacts.isNotEmpty ? contacts.first : null;

          final title = contacts != null && contacts.isNotEmpty
              ? contacts.first.nickname
              : filteredChats[index].title;

          return ListTile(
            onTap: () => _launchMessaging(filteredChats[index]),
            onLongPress: () async {
              return getIt.get<DialogService>().showModalSheetDialog(context, [
                if (isGroup)
                  SheetButton(
                    onTap: () => _renameChat(filteredChats[index]),
                    iconData: Icons.edit,
                    text: 'Rename Chat',
                  ),
                if (!isGroup)
                  SheetButton(
                    onTap: () => _renameContact(contact!),
                    iconData: Icons.edit,
                    text: 'Set Nickname',
                  ),
                SheetButton(
                  onTap: () => _muteChat(filteredChats[index]),
                  iconData: Icons.notifications_off,
                  text: 'Mute',
                ),
                SheetButton(
                  onTap: () => _leaveChat(filteredChats[index], title),
                  iconData: Icons.logout,
                  text: filteredChats[index].participants.length > 1
                      ? 'Leave Chat'
                      : 'Delete Chat',
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
