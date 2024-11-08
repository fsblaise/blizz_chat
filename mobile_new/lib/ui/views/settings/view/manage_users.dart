import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/preferences/shared_preferences/session_manager.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ManageUsersPage extends StatefulWidget {
  const ManageUsersPage({super.key});

  @override
  State<ManageUsersPage> createState() => _ManageUsersPageState();
}

class _ManageUsersPageState extends State<ManageUsersPage> {
  List<UserPrefsSession>? sessions;

  @override
  void initState() {
    sessions = getIt.get<SessionManager>().getSessions();
    super.initState();
  }

  Future<void> _signOut(BuildContext context) async {
    // sign out user
    await context.read<AuthCubit>().signOut();
    // close websocket
    context.read<MessagingCubit>().disconnect();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.router.replace(const WelcomeRoute());
    });
  }

  Future<void> _signOutSession(
    BuildContext context,
    UserPrefsSession session,
  ) async {
    if (session.isActive) {
      // sign out current user
      await _signOut(context);
    } else {
      await getIt.get<SessionManager>().signOutOtherSession(session);
    }
  }

  // Future<void> _deleteSession(
  //   BuildContext context,
  //   UserPrefsSession session,
  // ) async {
  //   if (session.isActive) {
  //     // delete current user
  //     // sign out of the cubit too
  //     // close ws
  //     // navigate to welcome
  //     await getIt.get<SessionManager>().removeSession(session);
  //     await _signOut(context);
  //   } else {
  //     // remove session
  //     // close the dialog
  //     await getIt.get<SessionManager>().removeSession(session);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: sessions!.length,
          itemBuilder: (context, index) {
            final session = sessions![index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        session.user!.fullName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(session.user!.email),
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Divider(
                        height: 0,
                        thickness: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (session.token != null)
                          TextButton(
                            onPressed: () async {
                              await _signOutSession(context, session);
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        // TextButton(
                        //   onPressed: () async {
                        //     await _deleteSession(context, session);
                        //   },
                        //   child: const Text(
                        //     'Delete',
                        //     style: TextStyle(
                        //       color: Colors.red,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
