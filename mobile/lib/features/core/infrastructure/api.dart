import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  final String apiUrl = dotenv.env['API_URL']!;

  Api();

  Uri assembleUri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    return Uri.parse(apiUrl + endpoint).resolveUri(
      Uri(queryParameters: queryParameters),
    );
  }

  void checkStatusCode(Response response) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Something went wrong!');
    }
  }

  Future<http.Response> get({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = assembleUri(endpoint, queryParameters);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }

    final response = await http.get(uri, headers: headers);

    checkStatusCode(response);

    return response;
  }

  Future<http.Response> post({
    required String endpoint,
    String? token,
    Map? body,
  }) async {
    final uri = assembleUri(endpoint);

    print(uri.toString());

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }

    final encodedBody = body != null ? jsonEncode(body) : null;

    final response = await http.post(
      uri,
      headers: headers,
      body: encodedBody,
    );

    print(response.statusCode);

    checkStatusCode(response);

    return response;
  }

  Future<http.Response> put({
    required String endpoint,
    String? token,
    Map? body,
  }) async {
    final uri = assembleUri(endpoint);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }

    final encodedBody = body != null ? jsonEncode(body) : null;

    final response = await http.put(
      uri,
      headers: headers,
      body: encodedBody,
    );

    checkStatusCode(response);

    return response;
  }

  Future<http.Response> patch({
    required String endpoint,
    String? token,
    Map? body,
  }) async {
    final uri = assembleUri(endpoint);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }

    final encodedBody = body != null ? jsonEncode(body) : null;

    final response = await http.patch(
      uri,
      headers: headers,
      body: encodedBody,
    );

    checkStatusCode(response);

    return response;
  }

  Future<http.Response> delete({
    required String endpoint,
    String? token,
    Map? body,
  }) async {
    final uri = assembleUri(endpoint);

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }

    final response = await http.delete(
      uri,
      headers: headers,
    );

    checkStatusCode(response);

    return response;
  }
}
