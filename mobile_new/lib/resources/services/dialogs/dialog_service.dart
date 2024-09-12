import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DialogService {
  @FactoryMethod(preResolve: true)
  static Future<DialogService> initialize() async {
    return DialogService();
  }

  Future<bool?> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String text,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> showInputDialog(
    BuildContext context, {
    required String title,
    String hintText = '',
  }) {
    final controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showModalSheetDialog(
    BuildContext context,
    List<Widget> buttons, {
    bool isScrollControlled = false,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: buttons
                  .map(
                    (button) => button,
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showSettingsSheetDialog(BuildContext context) {
    return showModalSheetDialog(context, [
      SheetButton(
        onTap: () async {
          await context.router.push(const SettingsRoute());
        },
        iconData: Icons.settings,
        text: 'More Settings',
      ),
      SheetButton(
        onTap: () async {
          final state = context.read<AuthCubit>().state as AuthAuthenticated;
          print(state.token);
        },
        iconData: Icons.settings,
        text: 'Fetch Token (DEV)',
      ),
      SheetButton(
        onTap: () async {
          await _signOut(context);
        },
        iconData: Icons.logout,
        text: 'Logout',
        noPop: true,
      ),
    ]);
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    await context.router.replace(const WelcomeRoute());
  }
}
