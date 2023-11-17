import 'package:blizz_chat/features/contacts/application/contacts_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddContactsWidget extends ConsumerWidget {
  final String keyword;
  const AddContactsWidget({super.key, required this.keyword});

  _addContact(BuildContext context, WidgetRef ref, FbUser user) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final contactsController = ref.read(contactsControllerProvider.notifier);
    try {
      await contactsController.addContact(user);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('User successfully added'),
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Failed to sign in')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<FbUser?>> users;
    if (keyword.isNotEmpty) {
      users = ref.watch(contactsControllerProvider.notifier).getUsers(keyword);
    } else {
      users = Future<List<FbUser?>>.value([]);
    }
    return Column(
      children: [
        const Text('Use the search field to find new contacts'),
        if (keyword.isNotEmpty)
          FutureBuilder(
              future: users,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return Column(
                        children: snapshot.data!
                            .map((user) => ListTile(
                                  title: Text(user!.fullName),
                                  trailing: IconButton(
                                      onPressed: () => _addContact(context, ref, user),
                                      icon: const Icon(Icons.person_add, color: Colors.deepPurple)),
                                ))
                            .toList());
                  } else {
                    return const Text('No users found!');
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }))
      ],
    );
  }
}
