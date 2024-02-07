import 'package:blizz_chat/features/core/application/user_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

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
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(_i10n.userUpdateSuccess),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pop(context);
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(_i10n.userUpdateFail)));
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
                Text('${_i10n.darkMode} ${userObj.settings['useDarkMode'] ? _i10n.on : _i10n.off}')
              ],
            ),
            TextButton(onPressed: _updateUser, child: Text(_i10n.saveChanges))
          ],
        ),
      );
    }, error: (e, s) {
      return Center(child: Text(_i10n.somethingWentWrong));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
