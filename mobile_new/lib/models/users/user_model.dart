import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String fullName,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, Object> json) => _$UserFromJson(json);
}
