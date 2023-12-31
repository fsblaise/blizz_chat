import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/chats/infrastructure/chats_provider.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chats_controller.g.dart';

@riverpod
class ChatsController extends _$ChatsController {
  @override
  FutureOr<List<Map<String, dynamic>>> build() async {
    print('build runs inside chats controller');
    List<Map<String, dynamic>> chats = [];
    final user = ref.watch(loggedInUserProvider);

    chats = await ref.watch(chatsRepostoryProvider).getChats(user!.uid);
    return chats;
  }

  Future<Map<String, dynamic>?> addContact(FbUser contact) async {
    final user = ref.watch(userObjectProvider);
    user.when(data: (value) async {
      final chat = await ref.watch(chatsRepostoryProvider).addContact(contact, value);
      // mimicking the firebase logic,
      // so we can update the contacts list locally within the state
      final prevState = await future;
      state = AsyncValue.data([
        ...prevState,
        {'id': chat['id'], 'name': chat['name']}
      ]);
      return chat;
    }, error: (e, s) {
      return null;
    }, loading: () {
      print('wtf');
    });
  }

  Future<void> removeChat(Map<String, dynamic> contact) async {
    final user = ref.watch(loggedInUserProvider);
    ref.watch(chatsRepostoryProvider).removeChat(contact['id'] as String, contact['fullName'] as String, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    prevState.removeWhere((element) => element['id'] == contact['id']);
    ref.notifyListeners();
  }

  Future<List<FbUser?>> getUsers(String keyword) async {
    if (keyword.contains('@')) {
      return ref.watch(chatsRepostoryProvider).getUserByEmail(keyword);
    } else {
      return ref.watch(chatsRepostoryProvider).getUsersByFullName(keyword);
    }
  }
}
