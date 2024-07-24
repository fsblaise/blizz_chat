part of '../api.dart';

@ChopperApi(baseUrl: '/users')
abstract class AuthService extends ChopperService {
  static AuthService create(ChopperClient client) => _$AuthService(client);

  @Post(
    path: '/signUp',
  )
  Future<Response> signUp(@Body() SignUpDto body);

  @Post(
    path: '/signIn',
  )
  Future<Response> signIn(@Body() SignInDto body);
}
