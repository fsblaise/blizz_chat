part of '../repositories.dart';

class KeysRepository extends RepositoryInterface<KeysService> {
  factory KeysRepository() {
    return _singleton;
  }
  KeysRepository._internal();

  static final KeysRepository _singleton = KeysRepository._internal();

  static Future<void> sharePublicKeys(ShareKeysDto publicKeys) async {
    final response = await _singleton.service.sharePublicKeys(publicKeys);
    if (response.isSuccessful) {
      print('Public key sent successfully');
    } else {
      print('Failed to send public key: ${response.error}');
    }
  }

  static Future<List<KeysDto>> fetchPublicKeys(List<String> emails) async {
    final response = await _singleton.service.fetchPublicKeys(emails);
    if (response.isSuccessful) {
      final decodedResponse = jsonDecode(response.bodyString);
      print(decodedResponse);
      return (decodedResponse as List<dynamic>)
          .map((keys) => KeysDto.fromJson(keys as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to receive public key: ${response.error}');
    }
  }
}
