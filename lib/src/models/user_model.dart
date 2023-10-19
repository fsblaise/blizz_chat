import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class FbUser {
  late String id;
  final String email;
  final String created;
  final String fullName;
  late String profileURL;
  late Map<String, String> contacts;
  late Map<String, dynamic> location;
  late Map<String, dynamic> settings;

  FbUser(this.email, this.created, this.fullName) {
    profileURL = '';
    contacts = {};
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
}
