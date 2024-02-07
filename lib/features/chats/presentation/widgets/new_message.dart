import 'package:blizz_chat/features/chats/application/chats_controller.dart';
import 'package:blizz_chat/features/chats/application/contacts_controller.dart';
import 'package:blizz_chat/features/chats/presentation/widgets/search_bar.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class NewMessagePage extends ConsumerStatefulWidget {
  const NewMessagePage({super.key});

  @override
  ConsumerState<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends ConsumerState<NewMessagePage> {
  final TextEditingController _searchController = TextEditingController();
  String _keyword = '';

  List<Map<String, dynamic>> _searchContacts(List<Map<String, dynamic>> contacts) {
    if (_keyword.isEmpty) return contacts;
    return contacts.where((element) => element['fullName']!.contains(_keyword)).toList();
  }

  _search(String value) {
    setState(() {
      _keyword = value;
    });
  }

  _addChat(Map<String, dynamic> contact) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final chatsController = ref.read(chatsControllerProvider.notifier);
    final contactsController = ref.read(contactsControllerProvider.notifier);
    try {
      final users = await contactsController.getUsers(contact['fullName']);
      // First we have to fetch the contact from firebase or riverpod then call the next method
      await chatsController.addChat(users[0] as FbUser);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(_i10n.chatAddSuccess),
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(_i10n.chatAddFail)));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(contactsControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(_i10n.newMessage),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            SearchBarWidget(
              searchController: _searchController,
              fn: _search,
            ),
            const SizedBox(
              height: 15,
            ),
            contacts.when(data: (contacts) {
              if (contacts.isNotEmpty) {
                final filteredContacts = _searchContacts(contacts);
                return Column(
                    children: filteredContacts
                        .map(
                          (contact) => ListTile(
                            onTap: () => _addChat(contact),
                            leading: const CircleAvatar(
                              child: Icon(Icons.account_circle),
                            ),
                            title: Text(contact['fullName'] as String),
                          ),
                        )
                        .toList());
              } else {
                return Center(child: Text(_i10n.noContactsFound));
              }
            }, error: (e, s) {
              return Center(child: Text(_i10n.somethingWentWrong));
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ],
        ));
  }
}
