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
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => Column(
        children: buttons
            .map(
              (button) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: button,
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> showSettingsSheetDialog(BuildContext context) {
    return showModalSheetDialog(context, [
      InkWell(
        onTap: () async {
          await _signOut(context);
        },
        child: const Row(
          children: [
            Icon(
              Icons.settings,
            ),
            Text(
              'Logout',
            ),
          ],
        ),
      ),
      InkWell(
        onTap: () async {
          await context.router.push(const SettingsRoute());
        },
        child: const Row(
          children: [
            Icon(
              Icons.settings,
            ),
            Text(
              'More Settings',
            ),
          ],
        ),
      ),
    ]);
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    await context.router.replace(const WelcomeRoute());
  }
}
