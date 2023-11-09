import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_controller.g.dart';

@riverpod
class ContactsController extends _$ContactsController {
  @override
  List<FbUser> build() {
    List<FbUser> contacts = [];
    // TODO: firebase fetch into contacts
    return contacts;
  }

  Future<void> addContact(FbUser contact) async {
    state.add(contact);
    // TODO: firebase call
  }

  Future<void> removeContact(FbUser contact) async {
    state.remove(contact);
    // TODO: firebase call
  }
}
