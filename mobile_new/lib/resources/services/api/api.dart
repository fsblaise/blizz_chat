library api;

import 'package:blizz_chat/models/models.dart';
import 'package:chopper/chopper.dart';

part 'auth/auth_service.dart';
part 'chats/chats_service.dart';
part 'messaging/messaging_service.dart';
part 'stories/stories_service.dart';
part 'users/users_service.dart';
part 'api.chopper.dart';

final apiService = ChopperClient(
  baseUrl: Uri.parse(''),
  services: [
    AuthService.create(
      ChopperClient(),
    ),
  ],
  converter: const JsonConverter(),
  errorConverter: const JsonConverter(),
);
