import 'package:blizz_chat/features/chats/application/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyContactsWidget extends ConsumerWidget {
  final String keyword;
  const MyContactsWidget({super.key, required this.keyword});

  List<Map<String, dynamic>> _search(List<Map<String, dynamic>> contacts) {
    if (keyword.isEmpty) return contacts;
    return contacts.where((element) => element['fullName']!.contains(keyword)).toList();
  }

  _removeContact(BuildContext context, WidgetRef ref, Map<String, dynamic> contact) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final contactsController = ref.read(contactsControllerProvider.notifier);
    try {
      await contactsController.removeContact(contact);
      Navigator.pop(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Contact successfully deleted'),
        elevation: 20.0,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Failed to delete contact'),
        elevation: 20.0,
      ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsControllerProvider);
    return contacts.when(data: (contacts) {
      if (contacts.isNotEmpty) {
        final filteredContacts = _search(contacts);
        return Column(
            children: filteredContacts
                .map(
                  (contact) => ListTile(
                    onLongPress: () => showModalBottomSheet(
                        showDragHandle: true,
                        enableDrag: true,
                        isDismissible: true,
                        context: context,
                        builder: (context) => SizedBox(
                              height: 120,
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                    child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () => _removeContact(context, ref, contact),
                                      leading: const Icon(Icons.delete),
                                      title: const Text('Delete'),
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
      } else {
        return const Center(child: Text('No contacts found!'));
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
