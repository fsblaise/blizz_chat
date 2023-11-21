import 'package:blizz_chat/features/messaging/domain/message_model.dart';
import 'package:blizz_chat/features/messaging/infrastructure/messaging_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messaging_controller.g.dart';

@riverpod
class MessagingController extends _$MessagingController {
  @override
  Stream<List<Message>> build(String chatId) {
    Stream<List<Message>> messages = ref.watch(messagingRepositoryProvider(chatId)).getMessageStream();
    return messages;
  }

  Future<Message?> addMessage(String msgText) async {
    final msg = await ref.watch(messagingRepositoryProvider(chatId)).addMessage(msgText);
    final prevState = await future;
    prevState.add(msg);
    ref.notifyListeners();
    /*final user = ref.watch(userObjectProvider);
    user.when(data: (value) async {
      final chat = await ref.watch(chatsRepostoryProvider).addContact(contact, value);
      // mimicking the firebase logic,
      // so we can update the contacts list locally within the state
      final prevState = await future;
      state = AsyncData([
        ...prevState,
        {'id': chat['id'], 'name': chat['name']}
      ]);
      return chat;
    }, error: (e, s) {
      return null;
    }, loading: () {
      print('wtf');
    });*/
  }

  Future<void> removeMessage(String msgId) async {
    /*final user = ref.watch(loggedInUserProvider);
    ref.watch(chatsRepostoryProvider).removeChat(contact['id'] as String, contact['fullName'] as String, user!.uid);
    // mimicking the firebase logic,
    // so we can update the contacts list locally within the state
    final prevState = await future;
    prevState.removeWhere((element) => element['id'] == contact['id']);
    ref.notifyListeners();*/
  }
}
