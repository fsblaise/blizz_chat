part of '../api.dart';

@ChopperApi(baseUrl: '/chats')
abstract class ChatsService extends ChopperService {
  static ChatsService create(ChopperClient client) => _$ChatsService(client);

  @Post()
  Future<Response<dynamic>> createChat(@Body() CreateChatDto body);

  @Get()
  Future<Response<List<dynamic>>> findAll();

  @Get(
    path: '/{id}',
  )
  Future<Response<dynamic>> findOne(@Path('id') String chatId);

  @Patch(
    path: '/{id}',
  )
  Future<Response<List<dynamic>>> update(
    @Body() ChatDto body,
    @Path('id') String chatId,
  );

  @Delete(
    path: '/{id}',
  )
  Future<Response<dynamic>> delete();
}
