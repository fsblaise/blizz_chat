import 'package:blizz_chat/features/chat/presentation/chat.dart';
import 'package:blizz_chat/features/contacts/application/contacts_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyContactsWidget extends ConsumerWidget {
  final String keyword;
  const MyContactsWidget({super.key, required this.keyword});

  List<Map<String, String>> _search(List<Map<String, String>> contacts) {
    if (keyword.isEmpty) return contacts;
    return contacts.where((element) => element['fullName']!.contains(keyword)).toList();
  }

  _removeContact(BuildContext context, WidgetRef ref, Map<String, String> contact) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final contactsController = ref.read(contactsControllerProvider.notifier);
    try {
      await contactsController.removeContact(contact);
      Navigator.pop(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Contact successfully removed'),
        elevation: 20.0,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Failed to remove contact'),
        elevation: 20.0,
      ));
    }
  }

  _openChat(context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => const ChatPage()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsControllerProvider);
    return contacts.when(data: (contacts) {
      final filteredContacts = _search(contacts);
      return Column(
          children: filteredContacts
              .map(
                (contact) => ListTile(
                  onTap: () => _openChat(context),
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
                                    onTap: () => _removeContact(context, ref, contact),
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
                                  ListTile(
                                    onTap: () {},
                                    leading: const Icon(Icons.block),
                                    title: const Text('Block'),
                                  ),
                                ],
                              )),
                            ),
                          )),
                  leading: const CircleAvatar(
                    child: Icon(Icons.account_circle),
                  ),
                  title: Text(contact['fullName'] as String),
                ),
              )
              .toList());
    }, error: (e, s) {
      return const Center(child: Text('Something went wrong'));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
