part of '../api.dart';

@ChopperApi(baseUrl: '/users')
abstract class AuthService extends ChopperService {
  static AuthService create(ChopperClient client) => _$AuthService(client);

  @Get()
  Future<Response<void>> fetchUserByToken();

  @Post(
    path: '/signUp',
  )
  Future<Response<dynamic>> signUp(@Body() SignUpDto body);

  @Post(
    path: '/signIn',
  )
  Future<Response<dynamic>> signIn(@Body() SignInDto body);
}
