// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Response<void>> fetchUserByToken() {
    final Uri $url = Uri.parse('/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<dynamic>> signUp(SignUpDto body) {
    final Uri $url = Uri.parse('/users/signUp');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> signIn(SignInDto body) {
    final Uri $url = Uri.parse('/users/signIn');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> update(UserProfile body) {
    final Uri $url = Uri.parse('/users');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ChatsService extends ChatsService {
  _$ChatsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ChatsService;

  @override
  Future<Response<dynamic>> createChat(CreateChatDto body) {
    final Uri $url = Uri.parse('/chats');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<dynamic>>> findAll() {
    final Uri $url = Uri.parse('/chats');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> findOne(String chatId) {
    final Uri $url = Uri.parse('/chats/${chatId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<dynamic>>> update(
    ChatDto body,
    String chatId,
  ) {
    final Uri $url = Uri.parse('/chats/${chatId}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> delete() {
    final Uri $url = Uri.parse('/chats/{id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$KeysService extends KeysService {
  _$KeysService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = KeysService;

  @override
  Future<Response<dynamic>> sharePublicKeys(ShareKeysDto body) {
    final Uri $url = Uri.parse('/keys/share');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fetchPublicKeys(List<String> emails) {
    final Uri $url = Uri.parse('/keys/fetch');
    final $body = emails;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$StoriesService extends StoriesService {
  _$StoriesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = StoriesService;

  @override
  Future<Response<dynamic>> createStory(CreateStoryDto body) {
    final Uri $url = Uri.parse('/stories');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> findAll() {
    final Uri $url = Uri.parse('/stories');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> findOne() {
    final Uri $url = Uri.parse('/stories/{id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> delete() {
    final Uri $url = Uri.parse('/stories/{id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UsersService extends UsersService {
  _$UsersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UsersService;

  @override
  Future<Response<dynamic>> findAll() {
    final Uri $url = Uri.parse('/users/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> search({
    String? email,
    String? fullName,
  }) {
    final Uri $url = Uri.parse('/users/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'email': email,
      'fullName': fullName,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addContact(AddContactDto body) {
    final Uri $url = Uri.parse('/users/add');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removeContact(String email) {
    final Uri $url = Uri.parse('/users/contact/${email}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateContact(Contact body) {
    final Uri $url = Uri.parse('/users/contact');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CompaniesService extends CompaniesService {
  _$CompaniesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CompaniesService;

  @override
  Future<Response<dynamic>> checkIfEmailInCompany(String email) {
    final Uri $url = Uri.parse('/companies/init/${email}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
