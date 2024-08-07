part of '../api.dart';

@ChopperApi(baseUrl: '/chats')
abstract class ChatsService extends ChopperService {
  static ChatsService create(ChopperClient client) => _$ChatsService(client);

  @Post()
  Future<Response<dynamic>> createChat(@Body() CreateChatDto body);

  @Get()
  Future<Response<void>> findAll();

  @Get(
    path: '/{id}',
  )
  Future<Response<dynamic>> findOne();

  @Patch(
    path: '/{id}',
  )
  Future<Response<dynamic>> update(@Body() UpdateChatDto body);

  @Delete(
    path: '/{id}',
  )
  Future<Response<dynamic>> delete();
}
