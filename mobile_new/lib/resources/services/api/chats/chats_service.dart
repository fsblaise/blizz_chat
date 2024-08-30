part of '../api.dart';

@ChopperApi(baseUrl: '/chats')
abstract class ChatsService extends ChopperService {
  static ChatsService create(ChopperClient client) => _$ChatsService(client);

  @FactoryConverter(
    response: null,
  )
  @Post()
  Future<Response<dynamic>> createChat(@Body() CreateChatDto body);

  @FactoryConverter(
    response: null,
  )
  @Get()
  Future<Response<List<dynamic>>> findAll();

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
