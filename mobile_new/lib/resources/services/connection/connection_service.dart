import 'dart:convert';

import 'package:blizz_chat/repositories/repositories.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Singleton()
class ConnectionService {
  @FactoryMethod(preResolve: true)
  static Future<ConnectionService> initialize() async {
    return ConnectionService();
  }

  Future<bool> hello({String? baseUrl}) async {
    print('hello called');
    final String _baseUrl = baseUrl ?? CompaniesRepository.getApiUrl();
    final url = Uri.parse('${_baseUrl}users/hello');
    try {
      final response = await http.get(url).timeout(Duration(seconds: 5));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
