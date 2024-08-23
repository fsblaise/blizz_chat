import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatefulWidget {
  const UsersList({required this.keyword, super.key});
  final String keyword;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late final AuthCubit _authCubit;
  late final UsersCubit _usersCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = context.read<AuthCubit>();
    _usersCubit = context.read<UsersCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('users list');
  }
}
