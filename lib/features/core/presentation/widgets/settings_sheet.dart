import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/core/presentation/pages/welcome.dart';
import 'package:blizz_chat/features/core/presentation/widgets/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    // TODO: add more buttons later, and also a user segment/options page could come here
                                    Icon(Icons.logout),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Logout',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.share),
                              title: const Text('Share'),
                              onTap: () async {
                                User? user = auth.getLoggedInUser();
                                // await auth.getUserById(user.uid);
                              },
                            ),
                            const Divider(),
                            ProfileWidget()
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
