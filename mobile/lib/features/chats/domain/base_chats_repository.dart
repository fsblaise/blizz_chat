import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseChatsRepository extends CollectionsRepository {
  BaseChatsRepository(super.fStore);

  Future<List<Map<String, dynamic>>> getChats(String userId);
  Future<Map<String, dynamic>> addChat(
      List<Map<String, dynamic>> chats, List<User> contact, User user);
  Future<Map<String, dynamic>> addGroupChat(List<User> contacts, User user);
  Future<void> removeChat(String deleteId, String deleteName, String userId);
}
