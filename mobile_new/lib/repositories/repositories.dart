library repositories;

import 'dart:convert';

import 'package:blizz_chat/models/auth/auth_dtos.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/database/database_service.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:chopper/chopper.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'auth/auth_repository.dart';
part 'chats/chats_repository.dart';
part 'map/map_repository.dart';
part 'messaging/messaging_repository.dart';
part 'stories/stories_repository.dart';
part 'users/users_repository.dart';
part 'repository_interface.dart';
