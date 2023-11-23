import 'package:blizz_chat/features/messaging/domain/message_model.dart';
import 'package:blizz_chat/features/messaging/infrastructure/messaging_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messaging_controller.g.dart';

@riverpod
class MessagingController extends _$MessagingController {
  @override
  FutureOr<List<Message>> build(String chatId) async {
    print('build runs inside messaging controller');

    List<Message> messages = await ref.watch(messagingRepositoryProvider(chatId)).getInitialMessages();
    messages.removeAt(0);
    ref.watch(messagingRepositoryProvider(chatId)).getMessageStream().listen((event) {
      messages.insert(0, event[0]);
    });

    return messages;
  }

  Future<Message?> addMessage(String msgText) async {
    final msg = await ref.watch(messagingRepositoryProvider(chatId)).addMessage(msgText);
    // Local mimicking is useless, since the stream listener already adds the message to the state anyways.
    // This behaviour can't be disabled, since we need to listen for changes, because the other participants can sen a message anytime.

    // final prevState = await future;
    // state = AsyncValue.data([msg, ...prevState]);
    return msg;
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
