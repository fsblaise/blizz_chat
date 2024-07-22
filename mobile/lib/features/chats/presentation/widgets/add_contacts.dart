import 'package:blizz_chat/features/chats/application/chats_controller.dart';
import 'package:blizz_chat/features/chats/application/contacts_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class AddChatsWidget extends ConsumerWidget {
  final String keyword;
  const AddChatsWidget({super.key, required this.keyword});

  _addContact(BuildContext context, WidgetRef ref, User contact) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final contactsController = ref.read(contactsControllerProvider.notifier);
    final chatsController = ref.read(chatsControllerProvider.notifier);
    try {
      await contactsController.addContact(contact);
      await chatsController.addChat(contact);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(_i10n.userAddSuccess),
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text(_i10n.userAddFail)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<User?>> users;
    if (keyword.isNotEmpty) {
      users = ref.watch(contactsControllerProvider.notifier).getUsers(keyword);
    } else {
      users = Future<List<User?>>.value([]);
    }
    return Column(
      children: [
        Text(_i10n.addContactsGuide),
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
                                      onPressed: () =>
                                          _addContact(context, ref, user),
                                      icon: const Icon(Icons.person_add,
                                          color: Colors.deepPurple)),
                                ))
                            .toList());
                  } else {
                    return Text(_i10n.noUsersFound);
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
