import 'package:blizz_chat/features/core/application/user_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  const ProfileWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  late TextEditingController _fullNameController;
  late FbUser userObj;

  _updateUser() async {
    print('update user');
    print(userObj.toJson());
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final userController = ref.read(userControllerProvider.notifier);
    try {
      await userController.updateUser(userObj);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('User successfully updated'),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pop(context);
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Failed to sign in')));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userControllerProvider);

    return user.when(data: (value) {
      userObj = value;
      _fullNameController = TextEditingController(text: userObj.fullName);
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: userObj.profileURL != '' ? Image.network(userObj.profileURL) : const Icon(Icons.person),
                  radius: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (fieldValue) {
                      setState(() {
                        userObj.fullName = fieldValue;
                      });
                    },
                    controller: _fullNameController,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Switch(
                    value: userObj.settings['useDarkMode'],
                    onChanged: (bool val) {
                      setState(() {
                        userObj.settings['useDarkMode'] = val;
                      });
                    }),
                const SizedBox(
                  width: 4,
                ),
                Text('Darkmode ${userObj.settings['useDarkMode'] ? 'on' : 'off'}')
              ],
            ),
            TextButton(onPressed: _updateUser, child: const Text('Save changes'))
          ],
        ),
      );
    }, error: (e, s) {
      return const Center(child: Text('Something went wrong'));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
