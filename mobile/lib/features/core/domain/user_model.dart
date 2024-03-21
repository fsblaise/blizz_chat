import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class FbUser {
  final String id;
  final String email;
  final String created;
  late String fullName;
  late String profileURL;
  late List<Map<String, String>> contacts;
  late List<Map<String, dynamic>> chats;
  late Map<String, dynamic> location;
  late Map<String, dynamic> settings;

  FbUser(this.email, this.created, this.fullName, this.id) {
    profileURL = '';
    contacts = [];
    chats = [];
    location = {
      'useLocation': false,
      'coords': '',
    };
    settings = {
      'useDarkMode': false,
      'accentColor': '',
    };
  }

  Map<String, dynamic> toJson() => _$FbUserToJson(this);
  factory FbUser.fromJson(Map<String, dynamic> json) => _$FbUserFromJson(json);
}
