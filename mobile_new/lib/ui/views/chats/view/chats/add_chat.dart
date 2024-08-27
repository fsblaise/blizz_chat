import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddChat extends StatefulWidget {
  const AddChat({
    required this.keyword,
    required this.usersCubit,
    required this.chatsCubit,
    super.key,
  });
  final String keyword;
  final UsersCubit usersCubit;
  final ChatsCubit chatsCubit;

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  List<User> contacts = [];
  List<User> filteredContacts = [];
  List<User> selectedContacts = [];
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = context.read<AuthCubit>();
  }

  void _filter() {
    if (widget.keyword.isNotEmpty) {
      if (widget.keyword.contains('@')) {
        filteredContacts = contacts
            .where((contact) => contact.email.contains(widget.keyword))
            .toList();
      } else {
        filteredContacts = contacts
            .where((contact) => contact.fullName.contains(widget.keyword))
            .toList();
      }
    } else {
      filteredContacts = contacts;
    }
  }

  void _handleSelection(bool? isChecked, User user) {
    if (isChecked != null) {
      setState(() {
        if (isChecked) {
          selectedContacts.add(user);
        } else {
          selectedContacts.remove(user);
        }
      });
    }
  }

  Future<void> _createChat() async {
    final dto = selectedContacts.map((contact) {
      return CreateParticipantDto(
        email: contact.email,
        fullName: contact.fullName,
      );
    }).toList();
    await widget.chatsCubit.createChat(dto, context);
  }

  Widget _renderList(UsersFetched state) {
    final theme = Theme.of(context);
    contacts = <User>[...state.contacts];
    _filter();
    if (filteredContacts.isNotEmpty) {
      return Column(
        children: [
          _renderEmpty(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                return CheckboxListTile.adaptive(
                  secondary: filteredContacts[index].profileUrl != null
                      ? CircleAvatar(
                          child: Image.network(
                              filteredContacts[index].profileUrl!),
                        )
                      : const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                  title: Text(filteredContacts[index].fullName),
                  subtitle: Text(filteredContacts[index].email),
                  value: selectedContacts.contains(filteredContacts[index]),
                  onChanged: (bool? isChecked) => _handleSelection(
                    isChecked,
                    filteredContacts[index],
                  ),
                );
              },
            ),
          ),
          if (selectedContacts.isNotEmpty)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton.icon(
                    onPressed: _createChat,
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(theme.primaryColor),
                      foregroundColor: const WidgetStatePropertyAll(
                        Colors.white,
                      ),
                      textStyle: const WidgetStatePropertyAll(
                        TextStyle(fontSize: 16),
                      ),
                    ),
                    label: const Text('Create chat'),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
        ],
      );
    } else if (widget.keyword.isNotEmpty) {
      return const Text(
        'No results found',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      );
    } else {
      return _renderEmpty();
    }
  }

  Widget _renderEmpty() {
    return const Text(
      'Add users to your chat.',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  Widget _renderLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersFetched) {
          return _renderList(state);
        } else if (state is UsersInitial) {
          return _renderEmpty();
        }
        return _renderLoading();
      },
    );
  }
}
