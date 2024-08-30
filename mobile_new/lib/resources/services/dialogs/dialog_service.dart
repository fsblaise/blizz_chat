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
          await _signOut(context);
        },
        iconData: Icons.logout,
        text: 'Logout',
      ),
    ]);
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    await context.router.replace(const WelcomeRoute());
  }
}
