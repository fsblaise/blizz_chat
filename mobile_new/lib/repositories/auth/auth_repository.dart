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
    final token = getIt.get<SessionManager>().getCurrentSession()?.token;

    // We should not fetch the user from the sharedprefs.
    // final user =
    //     getIt.get<SharedPreferencesService>().preferences!.getString('user');
    // We should fetch the user from the db,
    // which will check the token's validity too.
    try {
      final response = await _singleton.service.fetchUserByToken();
      if (token == null || !response.isSuccessful) {
        return null;
      } else {
        final decodedResponse =
            jsonDecode(response.bodyString) as Map<String, dynamic>;
        return AuthResponseDto(
          token: token,
          user: UserProfile.fromJson(decodedResponse),
        );
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> signOut() async {
    // TODO: implement
    await getIt.get<SessionManager>().signOut();
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

    await getIt
        .get<SessionManager>()
        .handleAuth(signInResponse.token, signInResponse.user);

    // await getIt
    //     .get<SharedPreferencesService>()
    //     .preferences!
    //     .setString('token', signInResponse.token);
    // await getIt
    //     .get<SharedPreferencesService>()
    //     .preferences!
    //     .setString('user', jsonEncode(signInResponse.user.toJson()));

    return signInResponse;
  }
}
