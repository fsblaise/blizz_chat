part of '../api.dart';

@ChopperApi(baseUrl: '/stories')
abstract class StoriesService extends ChopperService {
  static StoriesService create(ChopperClient client) =>
      _$StoriesService(client);

  @Post()
  Future<Response<dynamic>> createStory(@Body() CreateStoryDto body);

  @Get()
  Future<Response<dynamic>> findAll();

  @Get(
    path: '/{id}',
  )
  Future<Response<dynamic>> findOne();

  @Delete(
    path: '/{id}',
  )
  Future<Response<dynamic>> delete();
}
