part of '../api.dart';

// class TokenInterceptor implements Interceptor {
//   @override
//   FutureOr<Request> onRequest(Request request) async {
//     final token =
//         getIt.get<SharedPreferencesService>().preferences!.getString('token');

//     if (token == null) {
//       return request;
//     }
//     return request.copyWith(
//       headers: request.headers
//         ..addAll(
//           {
//             HttpHeaders.authorizationHeader: 'Bearer $token',
//           },
//         ),
//     );
//   }

//   @override
//   FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
//     // TODO: implement intercept
//     throw UnimplementedError();
//   }
// }

class TokenInterceptor implements Interceptor {
  TokenInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final token = getIt.get<SessionManager>().getCurrentSession()?.token;
    print(token);

    if (token == null) {
      return chain.proceed(chain.request);
    } else {
      final request =
          applyHeader(chain.request, 'Authorization', 'Bearer $token');
      return chain.proceed(request);
    }
  }
}
