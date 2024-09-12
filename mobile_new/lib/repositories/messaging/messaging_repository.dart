part of '../repositories.dart';

// websocket response handling and database save calls
// ignore: constant_identifier_names
const WS_URL = 'ws://192.168.0.13:3000';

class MessagingRepository {
  MessagingRepository();

  IO.Socket? _socket;

  final DatabaseService service = getIt.get<DatabaseService>();

  void connect(String token) {
    final urlWithToken = '$WS_URL?token=$token';
    print(urlWithToken);
    print(Uri.parse(WS_URL).toString());
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

  // TODO: Implement the listen method for the status too
  void listen(void Function(Message) onMessage) {
    _socket?.on('receiveMessage', (data) {
      final message =
          Message.fromJson(jsonDecode(data as String) as Map<String, dynamic>);
      // saveMessage(message); // Here we should not use this
      // We should pass the onMessage from the cubit
      // Inside the callback we should call the saveMessage function
      onMessage(message);
    });
  }

  void sendMessage(Message message) {
    _socket?.emit('receiveMessage', message.toJson());
  }

  void disconnect() {
    _socket?.disconnect();
  }

  Future<void> saveMessage(Message message) async {
    await service.saveMessage(message);
  }

  Future<List<Message>> fetchMessages(String chatId) async {
    return service.fetchMessages(chatId);
  }
}
