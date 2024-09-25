part of '../api.dart';

@ChopperApi(baseUrl: '/keys')
abstract class KeysService extends ChopperService {
  static KeysService create(ChopperClient client) => _$KeysService(client);

  @Post(path: '/share')
  Future<Response> sharePublicKeys(@Body() ShareKeysDto body);

  // post for safety reasons
  @Post(path: '/fetch')
  Future<Response> fetchPublicKeys(@Body() List<String> emails);
}
