part of '../repositories.dart';

class ChatsRepository extends RepositoryInterface<ChatsService> {
  factory ChatsRepository() {
    return _singleton;
  }
  ChatsRepository._internal();

  static final ChatsRepository _singleton = ChatsRepository._internal();

  static Future<List<Chat>> fetchChats() async {
    final response = await _singleton.service.findAll();
    if (response.isSuccessful) {
      final decodedResponse = jsonDecode(response.bodyString);
      return (decodedResponse as List<dynamic>)
          .map((chat) => Chat.fromJson(chat as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch chats');
    }
  }

  static Future<Chat> createChat(CreateChatDto dto) async {
    final response = await _singleton.service.createChat(dto);
    if (response.isSuccessful) {
      print("reacvh?");
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;
      print(decodedResponse);
      return Chat.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to create chat');
    }
  }
}
