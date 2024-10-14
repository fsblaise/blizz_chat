library api;

import 'dart:async';

import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/models/stories/story_dtos.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:chopper/chopper.dart';

part 'auth/auth_service.dart';
part 'chats/chats_service.dart';
part 'keys/keys_service.dart';
part 'stories/stories_service.dart';
part 'users/users_service.dart';
part 'api.chopper.dart';
part 'interceptors/interceptors.dart';
part 'companies/companies_service.dart';

final apiService = ChopperClient(
  // baseUrl: Uri.parse('http://192.168.9.27:3000/'),
  baseUrl: Uri.parse(CompaniesRepository.getApiUrl()),
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
    KeysService.create(
      ChopperClient(),
    ),
    StoriesService.create(
      ChopperClient(),
    ),
    CompaniesService.create(
      ChopperClient(),
    ),
  ],
  interceptors: [
    TokenInterceptor(),
  ],
  converter: const JsonConverter(),
  errorConverter: const JsonConverter(),
);
