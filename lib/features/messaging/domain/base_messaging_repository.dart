import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/messaging/domain/message_model.dart';

abstract class BaseMessagingRepository extends CollectionsRepository {
  BaseMessagingRepository(super.fStore);

  Future<List<Message>> getMoreMessages();
  Stream<List<Message>> getMessageStream();
  Future<Message> addMessage(String msgText);
  Future<void> removeMessage(String msgId);
}
