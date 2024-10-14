part of '../api.dart';

@ChopperApi(baseUrl: '/companies')
abstract class CompaniesService extends ChopperService {
  static CompaniesService create(ChopperClient client) =>
      _$CompaniesService(client);

  @Get(
    path: '/init/{email}',
  )
  Future<Response<dynamic>> checkIfEmailInCompany(@Path('email') String email);
}
