part of '../repositories.dart';

class AuthRepository extends RepositoryInterface<AuthService> {
  factory AuthRepository() {
    return _singleton;
  }
  AuthRepository._internal();

  static final AuthRepository _singleton = AuthRepository._internal();

  static Future<AuthResponseDto> signUp(SignUpDto body) async {
    final response = await _singleton.service.signUp(body);
    return handleSignInResponse(response);
  }

  static Future<AuthResponseDto> signIn(SignInDto body) async {
    final response = await _singleton.service.signIn(body);
    return handleSignInResponse(response);
  }

  static Future<AuthResponseDto?> getLoggedInUser() async {
    final token =
        getIt.get<SharedPreferencesService>().preferences!.getString('token');
    // We should not fetch the user from the sharedprefs.
    // final user =
    //     getIt.get<SharedPreferencesService>().preferences!.getString('user');
    print('fetch');
    final response = await _singleton.service.fetchUserByToken();
    print(response);
    if (token == null || !response.isSuccessful) {
      return null;
    } else {
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;
      return AuthResponseDto(
        token: token,
        user: User.fromJson(decodedResponse),
      );
    }

    // We should fetch the user from the db,
    // which will check the token's validity too.
  }

  static Future<void> signOut() async {
    // TODO: implement
    await getIt
        .get<SharedPreferencesService>()
        .preferences!
        .setString('token', '');
    await getIt
        .get<SharedPreferencesService>()
        .preferences!
        .setString('user', '');
  }

  /// It processes the signInResponse from the backend.
  /// Both signIn and signUp has the same return type,
  /// to make users automatically signed in after signUp.
  /// This makes the auth process simpler and more user friendly.
  static Future<AuthResponseDto> handleSignInResponse(
    Response<dynamic> response,
  ) async {
    final decodedResponse =
        jsonDecode(response.bodyString) as Map<String, dynamic>;
    final signInResponse = AuthResponseDto.fromJson(decodedResponse);

    print(signInResponse);

    await getIt
        .get<SharedPreferencesService>()
        .preferences!
        .setString('token', signInResponse.token);
    await getIt
        .get<SharedPreferencesService>()
        .preferences!
        .setString('user', jsonEncode(signInResponse.user.toJson()));

    return signInResponse;
  }
}
