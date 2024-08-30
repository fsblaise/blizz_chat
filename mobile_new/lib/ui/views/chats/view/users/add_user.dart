import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUser extends StatefulWidget {
  const AddUser({required this.keyword, required this.callback, super.key});
  final String keyword;
  final void Function() callback;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late final UsersCubit _usersCubit;
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _usersCubit = context.read<UsersCubit>();
    _authCubit = context.read<AuthCubit>();
  }

  Future<void> _addContact(String email, String fullName) async {
    await _authCubit.addContact(email, fullName);
    widget.callback();
  }

  void _viewProfile(User user) {
    // navigate to profile page, pass in user data
  }

  Widget _renderResults(UsersFetched state) {
    if (state.users.isNotEmpty) {
      final theme = Theme.of(context);
      return Column(
        children: [
          _renderEmpty(),
          Column(
            children: state.users.map((user) {
              return ListTile(
                onTap: !state.contacts.contains(user)
                    ? () => _addContact(user.email, user.fullName)
                    : null,
                onLongPress: () async {
                  return getIt
                      .get<DialogService>()
                      .showModalSheetDialog(context, [
                    SheetButton(
                      onTap: () => _viewProfile(user),
                      iconData: Icons.contact_page,
                      text: 'View Profile',
                    ),
                  ]);
                },
                leading: user.profileUrl != null
                    ? CircleAvatar(
                        child: Image.network(user.profileUrl!),
                      )
                    : const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                title: Text(user.fullName),
                subtitle: Text(user.email),
                trailing: !state.contacts.contains(user)
                    ? Icon(
                        Icons.person_add_alt,
                        color: theme.primaryColor,
                      )
                    : null,
              );
            }).toList(),
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
      'Use the searchbar to find users.',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.keyword.isNotEmpty) {
      if (widget.keyword.contains('@')) {
        _usersCubit.search(email: widget.keyword);
      } else {
        _usersCubit.search(fullName: widget.keyword);
      }
    } else {
      _usersCubit.clear();
    }
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersFetched) {
          return _renderResults(state);
        } else if (state is UsersInitial) {
          return _renderEmpty();
        }
        return const LoadingWidget();
      },
    );
  }
}
