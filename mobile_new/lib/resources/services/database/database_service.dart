import 'package:blizz_chat/models/models.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DatabaseService {
  final appDatabase = AppDatabase();

  @FactoryMethod(preResolve: true)
  static Future<DatabaseService> initialize() async {
    return DatabaseService();
  }

  Future<void> saveMessage(Message message) async {
    await appDatabase.into(appDatabase.messagesTable).insert(message);
  }

  Future<List<Message>> fetchMessages(String chatId) async {
    return (appDatabase.select(appDatabase.messagesTable)
          ..where((message) => message.id.equals(chatId)))
        .get();
  }
}
