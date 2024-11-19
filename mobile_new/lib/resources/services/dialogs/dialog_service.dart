import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/users/user_model.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/preferences/shared_preferences/session_manager.dart';
import 'package:blizz_chat/resources/services/services.dart';
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

  Future<void> showUserManageDialog(BuildContext context) async {
    final sessions = getIt.get<SessionManager>().getSessions();
    final theme = Theme.of(context);
    await showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Manage users'),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
          contentPadding: const EdgeInsets.all(0),
          actionsPadding: const EdgeInsets.only(bottom: 8),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sessions!.length,
              itemBuilder: (context, index) {
                bool isLoading = false;
                return StatefulBuilder(
                  builder: (context, setState) {
                    return ListTile(
                      title: Text(sessions[index].user!.email),
                      subtitle: Text(sessions[index].apiUrl),
                      onTap: !sessions[index].isActive
                          ? () async {
                              setState(() {
                                isLoading = true;
                              });
                              final response =
                                  await _changeUser(context, sessions[index]);
                              if (!response) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "This user's workspace (server) is not available!",
                                    ),
                                  ),
                                );
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          : null,
                      leading: const Icon(Icons.person),
                      trailing: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 3),
                            )
                          : sessions[index].isActive
                              ? Icon(Icons.check, color: theme.primaryColor)
                              : null,
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              onTap: () async {
                _addUser(context);
              },
              leading: Icon(Icons.person_add, color: theme.primaryColor),
              title: Text(
                'Add new user',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              onTap: () async {
                context.router.push(const ManageUsersRoute());
              },
              leading: Icon(Icons.people, color: theme.primaryColor),
              title: Text(
                'Manage users',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              onTap: () async {
                _signOutAll(context);
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Sign out all users',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showSettingsSheetDialog(BuildContext context) {
    final session = getIt.get<SessionManager>().getCurrentSession();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SheetButton(
                  onTap: () async {
                    // await context.router.push(const SettingsRoute());
                  },
                  iconData: Icons.settings,
                  text: 'More Settings',
                ),
                SheetButton(
                  onTap: () async {
                    final state =
                        context.read<AuthCubit>().state as AuthAuthenticated;
                    print(state.userSession.token);
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
              ],
            ),
          ),
        ],
      ),
    );
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

  Future<bool> _changeUser(
    BuildContext context,
    UserPrefsSession session,
  ) async {
    // disconnect websocket
    // set new active session
    // don't sign out user
    // but replace authCubit
    // navigate to welcome

    // check if the url is available
    final response =
        await getIt.get<ConnectionService>().hello(baseUrl: session.apiUrl);

    if (response) {
      context.read<MessagingCubit>().disconnect();
      await getIt.get<SessionManager>().setActiveSession(
            session.email,
            apiUrl: session.apiUrl,
          );
      await context.read<AuthCubit>().setCurrentUser(session);

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await context.router.replace(const WelcomeRoute());
      });
    }
    return response;
  }

  Future<void> _addUser(BuildContext context) async {
    context.read<MessagingCubit>().disconnect();
    await getIt.get<SessionManager>().removeActiveSession();
    await context.read<AuthCubit>().clearCurrentUser();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.router.replace(const WelcomeRoute());
    });
  }

  Future<void> _signOutAll(BuildContext context) async {
    // sign out of current user (cubit)
    // sign out of the rest
    // disconnect websocket
    // navigate to welcome
    context.read<MessagingCubit>().disconnect();
    await context.read<AuthCubit>().signOut();
    await getIt.get<SessionManager>().signOutOfAll();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.router.replace(const WelcomeRoute());
    });
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
}
