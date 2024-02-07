import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/core/presentation/pages/welcome.dart';
import 'package:blizz_chat/features/core/presentation/widgets/language_selector.dart';
import 'package:blizz_chat/features/core/presentation/widgets/profile.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final I10n _i10n = locator<I10n>();

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({
    super.key,
    required this.auth,
  });

  final AuthRepository auth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: true,
              enableDrag: true,
              isScrollControlled: true,
              builder: (context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.18,
                  minChildSize: 0.18,
                  maxChildSize: 1,
                  builder: (context, scrollController) => SingleChildScrollView(
                    // uncomment this when you want resizing capabilities
                    controller: scrollController,
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color.fromRGBO(150, 150, 150, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await auth.logOut();
                                Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(context,
                                    CupertinoPageRoute(builder: (context) => const WelcomePage()), (route) => false);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    // TODO: add more buttons later, and also a user segment/options page could come here
                                    const Icon(Icons.logout),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      _i10n.logout,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                            const LanguageSelectorWidget(),
                            const Divider(),
                            const ProfileWidget()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        icon: const Icon(Icons.more_vert));
  }
}
