import 'package:blizz_chat/src/pages/welcome.dart';
import 'package:blizz_chat/src/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({
    super.key,
    required this.auth,
  });

  final AuthService auth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isDismissible: true,
              enableDrag: true,
              isScrollControlled: true,
              builder: (context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.3,
                  minChildSize: 0.2,
                  maxChildSize: 1,
                  builder: (context, scrollController) => SingleChildScrollView(
                    // uncomment this when you want resizing capabilities
                    // controller: scrollController,
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                    )
                                  ],
                                ),
                              ),
                            )
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
