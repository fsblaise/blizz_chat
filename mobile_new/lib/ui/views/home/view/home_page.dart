import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/auth/auth_dtos.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/views/auth/auth.dart';
import 'package:blizz_chat/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List<int> prevPages = [];

  void onPageChanged(int index) {
    if (selectedPage == index) return;
    setState(() {
      prevPages.add(selectedPage);
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (prevPages.isNotEmpty) {
          setState(() {
            selectedPage = prevPages.removeLast();
          });
        }
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(['Chats', 'Stories', 'Map'][selectedPage]),
          automaticallyImplyLeading: false,
          actions: [],
        ),
        body: [
          Center(
            child: FilledButton(
              child: const Text('Chats'),
              onPressed: _signOut,
            ),
          ),
          const Center(
            child: Text('Stories'),
          ),
          const Center(
            child: Text('Map'),
          ),
        ][selectedPage],
        bottomNavigationBar: Navigation(
          selectedIndex: selectedPage,
          onChanged: onPageChanged,
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await context.read<AuthCubit>().signOut();
    await context.router.replace(const WelcomeRoute());
  }
}
