import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/contacts/infrastructure/contacts_provider.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_controller.g.dart';

@riverpod
class ContactsController extends _$ContactsController {
  @override
  Future<List<Map<String, String>>> build() async {
    List<Map<String, String>> contacts = [];
    final user = ref.watch(loggedInUserProvider);

    contacts = await ref.watch(contactsRepostoryProvider).getContacts(user!.uid);
    return contacts;
  }

  Future<void> addContact(FbUser contact) async {
    final user = ref.watch(loggedInUserProvider);
    ref.watch(contactsRepostoryProvider).addContact(contact, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    state = AsyncData([
      ...prevState,
      {'id': contact.id, 'fullName': contact.fullName}
    ]);
  }

  Future<void> removeContact(Map<String, String> contact) async {
    final user = ref.watch(loggedInUserProvider);
    ref
        .watch(contactsRepostoryProvider)
        .removeContact(contact['id'] as String, contact['fullName'] as String, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    prevState.removeWhere((element) => element['id'] == contact['id']);
    ref.notifyListeners();
  }

  Future<List<FbUser?>> getUsers(String keyword) async {
    if (keyword.contains('@')) {
      return ref.watch(contactsRepostoryProvider).getUserByEmail(keyword);
    } else {
      return ref.watch(contactsRepostoryProvider).getUsersByFullName(keyword);
    }
  }
}
