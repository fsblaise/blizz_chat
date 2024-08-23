library api;

import 'dart:async';
import 'dart:io';

import 'package:blizz_chat/models/chats/chat_dtos.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/models/stories/story_dtos.dart';
import 'package:blizz_chat/models/users/user_dtos.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:chopper/chopper.dart';

part 'auth/auth_service.dart';
part 'chats/chats_service.dart';
part 'messaging/messaging_service.dart';
part 'stories/stories_service.dart';
part 'users/users_service.dart';
part 'api.chopper.dart';
part 'interceptors/interceptors.dart';

final apiService = ChopperClient(
  // baseUrl: Uri.parse('http://192.168.9.27:3000/'),
  baseUrl: Uri.parse('http://192.168.0.139:3000/'),
  services: [
    AuthService.create(
      ChopperClient(),
    ),
    ChatsService.create(
      ChopperClient(),
    ),
    UsersService.create(
      ChopperClient(),
    ),
  ],
  interceptors: [
    TokenInterceptor(),
  ],
  converter: const JsonConverter(),
  errorConverter: const JsonConverter(),
);
