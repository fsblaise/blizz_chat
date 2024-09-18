import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
class AddContactDto with _$AddContactDto {
  const factory AddContactDto({
    required String fullName,
    required String email,
  }) = _AddContactDto;

  factory AddContactDto.fromJson(Map<String, dynamic> json) =>
      _$AddContactDtoFromJson(json);
}

@freezed
class UserStatusDto with _$UserStatusDto {
  const factory UserStatusDto({
    required String userEmail,
    required String status,
  }) = _UserStatusDto;

  factory UserStatusDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatusDtoFromJson(json);
}
