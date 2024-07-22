import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/chats/infrastructure/chats_provider.dart';
import 'package:blizz_chat/features/core/application/user_controller.dart';
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

    chats = await ref.watch(chatsRepositoryProvider).getChats(user!.uid);
    return chats;
  }

  Future<Map<String, dynamic>?> addChat(User contact) async {
    final user = ref.watch(userControllerProvider);
    user.when(data: (value) async {
      final prevState = await future;
      final chat = await ref
          .watch(chatsRepositoryProvider)
          .addChat(prevState, [contact], value);
      // mimicking the firebase logic,
      // so we can update the contacts list locally within the state
      print(prevState);
      print(chat);
      if (prevState
          .where((element) => element['id'] == chat['id'])
          .isNotEmpty) {
        print('contains');
        return null;
      }
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

  Future<void> removeChat(Map<String, dynamic> chat) async {
    final user = ref.watch(loggedInUserProvider);
    ref
        .watch(chatsRepositoryProvider)
        .removeChat(chat['id'] as String, chat['name'] as String, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    prevState.removeWhere((element) => element['id'] == chat['id']);
    ref.notifyListeners();
  }
}
