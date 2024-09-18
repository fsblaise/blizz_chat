import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatefulWidget {
  UsersList({
    required this.keyword,
    required this.usersCubit,
    required this.authCubit,
    required this.resetSearch,
    super.key,
  });
  late String keyword;
  final UsersCubit usersCubit;
  final AuthCubit authCubit;
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

  Future<void> _removeContact(Contact contact) async {
    final isConfirm = await getIt.get<DialogService>().showConfirmDialog(
          context,
          title: 'Remove user',
          text: 'Are you sure that you want to remove ${contact.nickname}?',
        );
    print(isConfirm);
    if (isConfirm == null || !isConfirm) {
      return;
    }
    await widget.authCubit.removeContact(contact);
    await widget.usersCubit.fetchContacts();
    // authcubit kell majd
  }

  Widget _renderList(UsersFetched state) {
    final user = widget.authCubit.getCurrentUser();
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
          final contact = user!.contacts.firstWhere(
            (contact) => contact.email == filteredContacts[index].email,
          );
          print(contact);
          final name = contact.nickname;
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
                  onTap: () => _renameContact(contact),
                  iconData: Icons.edit,
                  text: 'Set Nickname',
                ),
                SheetButton(
                  onTap: () => _removeContact(contact),
                  iconData: Icons.person_remove,
                  text: 'Remove contact',
                ),
              ]);
            },
            leading: Stack(
              children: [
                if (filteredContacts[index].profileUrl != null)
                  CircleAvatar(
                    child: Image.network(filteredContacts[index].profileUrl!),
                  )
                else
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: StatusDot(
                    isOnline: filteredContacts[index].isOnline,
                  ),
                ),
              ],
            ),
            title: Text(name),
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
