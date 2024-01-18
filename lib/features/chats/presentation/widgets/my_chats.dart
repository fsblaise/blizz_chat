import 'package:blizz_chat/features/messaging/presentation/pages/messaging.dart';
import 'package:blizz_chat/features/chats/application/chats_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyChatsWidget extends ConsumerWidget {
  final String keyword;
  const MyChatsWidget({super.key, required this.keyword});

  List<Map<String, dynamic>> _search(List<Map<String, dynamic>> chats) {
    if (keyword.isEmpty) return chats;
    return chats.where((element) => element['name']!.contains(keyword)).toList();
  }

  _removeContact(BuildContext context, WidgetRef ref, Map<String, dynamic> chat) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final chatsController = ref.read(chatsControllerProvider.notifier);
    try {
      await chatsController.removeChat(chat);
      Navigator.pop(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Chat successfully deleted'),
        elevation: 20.0,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Failed to delete chat'),
        elevation: 20.0,
      ));
    }
  }

  _openChat(context, chat) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => MessagingPage(
                  chat: chat,
                )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatsControllerProvider);
    return chats.when(data: (chats) {
      if (chats.isNotEmpty) {
        final filteredChats = _search(chats);
        return Column(
            children: filteredChats
                .map(
                  (chat) => ListTile(
                    onTap: () => _openChat(context, chat),
                    onLongPress: () => showModalBottomSheet(
                        showDragHandle: true,
                        enableDrag: true,
                        isDismissible: true,
                        context: context,
                        builder: (context) => SizedBox(
                              height: 300,
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                    child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {},
                                      leading: const Icon(Icons.mail),
                                      title: const Text('Mark as read'),
                                    ),
                                    ListTile(
                                      onTap: () => _removeContact(context, ref, chat),
                                      leading: const Icon(Icons.delete),
                                      title: const Text('Delete'),
                                    ),
                                    ListTile(
                                      onTap: () {},
                                      leading: const Icon(Icons.archive),
                                      title: const Text('Archive'),
                                    ),
                                    ListTile(
                                      onTap: () {},
                                      leading: const Icon(Icons.notifications_off),
                                      title: const Text('Mute'),
                                    ),
                                  ],
                                )),
                              ),
                            )),
                    leading: const CircleAvatar(
                      child: Icon(Icons.account_circle),
                    ),
                    title: Text(chat['name'] as String),
                  ),
                )
                .toList());
      } else {
        return const Center(child: Text('No chats found!'));
      }
    }, error: (e, s) {
      return const Center(child: Text('Something went wrong'));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
