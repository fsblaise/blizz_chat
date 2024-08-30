import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatefulWidget {
  UsersList({
    required this.keyword,
    required this.usersCubit,
    required this.resetSearch,
    super.key,
  });
  late String keyword;
  final UsersCubit usersCubit;
  final void Function() resetSearch;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User> contacts = [];
  List<User> filteredContacts = [];

  Future<void> _handleRefresh() async {
    await widget.usersCubit.fetchContacts();
    widget.keyword = '';
    widget.resetSearch();
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

  void _viewProfile(User user) {
    // navigate to profile page, pass in user data
  }

  void _removeContact(User user) {
    // authcubit kell majd
  }

  Widget _renderList(UsersFetched state) {
    contacts = <User>[...state.contacts];
    _filter();
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: filteredContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _viewProfile(filteredContacts[index]),
            onLongPress: () async {
              return getIt.get<DialogService>().showModalSheetDialog(context, [
                SheetButton(
                  onTap: () => _viewProfile(filteredContacts[index]),
                  iconData: Icons.contact_page,
                  text: 'View Profile',
                ),
                SheetButton(
                  onTap: () => _removeContact(filteredContacts[index]),
                  iconData: Icons.person_remove,
                  text: 'Remove contact',
                ),
              ]);
            },
            leading: filteredContacts[index].profileUrl != null
                ? CircleAvatar(
                    child: Image.network(filteredContacts[index].profileUrl!),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
            title: Text(filteredContacts[index].fullName),
            subtitle: Text(filteredContacts[index].email),
          );
        },
      ),
    );
  }

  Widget _renderEmpty() {
    return const Text('Add users as contacts.');
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
        return const LoadingWidget();
      },
    );
  }
}
