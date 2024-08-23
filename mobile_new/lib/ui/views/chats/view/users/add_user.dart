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

  Widget _renderResults(UsersFetched state) {
    if (state.users.isNotEmpty) {
      return Column(
        children: state.users.map((user) {
          return ListTile(
            onTap: () => _addContact(user.email, user.fullName),
            leading: user.profileUrl != null
                ? CircleAvatar(
                    child: Image.network(user.profileUrl!),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
            title: Text(user.fullName),
            subtitle: Text(user.email),
          );
        }).toList(),
      );
    } else {
      return const Text('No results found');
    }
  }

  Widget _renderEmpty() {
    return const Text('Use the searchbar to find users.');
  }

  Widget _renderLoading() {
    return const Center(child: CircularProgressIndicator());
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
        return _renderLoading();
      },
    );
  }
}
