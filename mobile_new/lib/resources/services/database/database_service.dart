import 'package:blizz_chat/models/models.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DatabaseService {
  final appDatabase = AppDatabase();

  @FactoryMethod(preResolve: true)
  static Future<DatabaseService> initialize() async {
    return DatabaseService();
  }

  /// Saves a message to the database
  Future<void> saveMessage(Message message) async {
    await appDatabase.into(appDatabase.messagesTable).insert(message);
  }

  /// Fetches all messages for a given chat
  Future<List<Message>> fetchMessages(String chatId) async {
    return (appDatabase.select(appDatabase.messagesTable)
          ..where((message) => message.chatId.equals(chatId)))
        .get();
  }

  /// Deletes a message from the database
  Future<void> deleteMessage(String messageId) async {
    await (appDatabase.delete(appDatabase.messagesTable)
          ..where((message) => message.id.equals(messageId)))
        .go();
  }
}
