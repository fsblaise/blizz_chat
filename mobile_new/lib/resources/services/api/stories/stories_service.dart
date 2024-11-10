part of '../api.dart';

@ChopperApi(baseUrl: '/stories')
abstract class StoriesService extends ChopperService {
  static StoriesService create(ChopperClient client) =>
      _$StoriesService(client);

  @Post()
  @Multipart()
  Future<Response<dynamic>> createStory(
    @Part('createStoryDto') String createStoryDtoJson,
    @PartFile('file') MultipartFile file,
  );

  @Get()
  Future<Response<dynamic>> findAll();

  @Get(
    path: '/{id}',
  )
  Future<Response<dynamic>> findOne(@Path('id') String id);

  @Delete(
    path: '/{id}',
  )
  Future<Response<dynamic>> delete(@Path('id') String id);
}
