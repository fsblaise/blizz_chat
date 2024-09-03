part of '../repositories.dart';

class UsersRepository extends RepositoryInterface<UsersService> {
  factory UsersRepository() {
    return _singleton;
  }
  UsersRepository._internal();

  static final UsersRepository _singleton = UsersRepository._internal();

  static Future<List<User>> fetchContacts() async {
    final response = await _singleton.service.findAll();
    if (response.isSuccessful) {
      final decodedResponse = jsonDecode(response.bodyString);
      return (decodedResponse as List<dynamic>)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  static Future<List<User>> search({
    String? email,
    String? fullName,
  }) async {
    final response = await _singleton.service.search(
      email: email,
      fullName: fullName,
    );
    if (response.isSuccessful) {
      final decodedResponse = jsonDecode(response.bodyString);
      return (decodedResponse as List<dynamic>)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  static Future<UserProfile> addUser(
    String email,
    String fullName,
  ) async {
    final response = await _singleton.service.addContact(
      AddContactDto(
        email: email,
        fullName: fullName,
      ),
    );
    print(response);
    if (response.isSuccessful) {
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;
      return UserProfile.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to add user');
    }
  }

  static Future<UserProfile> removeUser(
    String email,
  ) async {
    print(email);
    final response = await _singleton.service.removeContact(email);
    print(response);
    if (response.isSuccessful) {
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;
      return UserProfile.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to remove user');
    }
  }

  static Future<UserProfile> renameContact(Contact contact) async {
    final response = await _singleton.service.updateContact(contact);
    if (response.isSuccessful) {
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;
      return UserProfile.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to rename contact');
    }
  }
}
