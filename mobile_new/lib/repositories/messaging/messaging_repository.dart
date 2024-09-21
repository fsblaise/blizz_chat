part of '../repositories.dart';

// websocket response handling and database save calls
// ignore: non_constant_identifier_names
String WS_URL = 'ws://${dotenv.env['API_URL']}:3000';

class MessagingRepository {
  MessagingRepository();

  IO.Socket? _socket;

  final DatabaseService service = getIt.get<DatabaseService>();

  /// Websocket methods

  void connect(String token) {
    final urlWithToken = '$WS_URL?token=$token';
    // print(urlWithToken);
    // print(Uri.parse(WS_URL).toString());
    try {
      _socket = IO.io(urlWithToken, <String, dynamic>{
        'transports': ['websocket'],
      });

      _socket?.on('connect', (_) {
        print('Connected to WebSocket');
      });

      _socket?.on('disconnect', (_) {
        print('Disconnected from WebSocket');
      });
    } catch (e) {
      print('Error connecting to WebSocket: $e');
    }
  }

  /// Listen for messages from the server
  /// This method only formats the incoming data
  /// The callback does the rest
  void listenForMessages(void Function(Message) onMessage) {
    _socket?.on('receiveMessage', (data) {
      print(data);
      final message = Message.fromJson(data as Map<String, dynamic>);
      // saveMessage(message); // Here we should not use this
      // We should pass the onMessage from the cubit
      // Inside the callback we should call the saveMessage function
      print('Received message: $message');
      onMessage(message);
    });
  }

  void listenForStatus(void Function(UserStatusDto?) onStatus) {
    _socket?.on('userStatus', (data) {
      try {
        print(data);
        final dataMap = data as Map<String, dynamic>;
        final dto = UserStatusDto.fromJson(dataMap);
        onStatus(dto);
      } catch (e) {
        print('Error parsing userStatus data: $e');
        onStatus(null);
      }
    });
  }

  void sendMessage(MessageDto message) {
    _socket?.emit('createMessage', message.toJson());
  }

  void disconnect() {
    _socket?.disconnect();
  }

  /// Database methods

  Future<void> saveMessage(Message message) async {
    await service.saveMessage(message);
  }

  Future<List<Message>> fetchMessages(String chatId) async {
    return service.fetchMessages(chatId);
  }

  Future<void> deleteMessage(String messageId) async {
    await service.deleteMessage(messageId);
  }
}
