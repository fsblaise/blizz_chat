part of '../api.dart';

@ChopperApi(baseUrl: '/users')
abstract class UsersService extends ChopperService {
  static UsersService create(ChopperClient client) => _$UsersService(client);

  @Get(
    path: '/all',
  )
  Future<Response<dynamic>> findAll();

  @Get(
    path: '/search',
  )
  Future<Response<dynamic>> search({
    @Query('email') String? email,
    @Query('fullName') String? fullName,
  });

  @Post(path: '/add')
  Future<Response<dynamic>> addContact(@Body() AddContactDto body);

  @Delete(path: '/contact/{email}')
  Future<Response<dynamic>> removeContact(@Path('email') String email);

  @Patch(path: '/contact')
  Future<Response<dynamic>> updateContact(@Body() Contact body);
}
