import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/chats/infrastructure/contacts_provider.dart';
import 'package:blizz_chat/features/core/application/user_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_controller.g.dart';

@riverpod
class ContactsController extends _$ContactsController {
  @override
  FutureOr<List<Map<String, dynamic>>> build() async {
    print('build runs inside chats controller');
    List<Map<String, dynamic>> contacts = [];
    final user = ref.watch(loggedInUserProvider);

    contacts =
        await ref.watch(contactsRepositoryProvider).getContacts(user!.uid);
    return contacts;
  }

  Future<Map<String, dynamic>?> addContact(User contact) async {
    final user = ref.watch(userControllerProvider);
    user.when(data: (value) async {
      final contactMap = await ref
          .watch(contactsRepositoryProvider)
          .addContact(contact, value);
      // mimicking the firebase logic,
      // so we can update the contacts list locally within the state
      final prevState = await future;
      print(prevState);
      print(contactMap);
      if (prevState
          .where((element) =>
              element['id'] == contactMap['id'] &&
              element['fullName'] == contactMap['fullName'])
          .isNotEmpty) {
        print('contains');
        return null;
      }
      state = AsyncValue.data([
        ...prevState,
        {'id': contactMap['id'], 'fullName': contactMap['fullName']}
      ]);
      return contactMap;
    }, error: (e, s) {
      return null;
    }, loading: () {
      print('wtf');
    });
    return null;
  }

  Future<void> removeContact(Map<String, dynamic> contact) async {
    final user = ref.watch(loggedInUserProvider);
    ref.watch(contactsRepositoryProvider).removeContact(
        contact['id'] as String, contact['fullName'] as String, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    prevState.removeWhere((element) => element['id'] == contact['id']);
    ref.notifyListeners();
  }

  Future<List<User?>> getUsers(String keyword) async {
    if (keyword.contains('@')) {
      return ref.watch(contactsRepositoryProvider).getUserByEmail(keyword);
    } else {
      return ref.watch(contactsRepositoryProvider).getUsersByFullName(keyword);
    }
  }
}
