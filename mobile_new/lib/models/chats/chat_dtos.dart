import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_dtos.freezed.dart';
part 'chat_dtos.g.dart';

@freezed
class CreateChatDto with _$CreateChatDto {
  const factory CreateChatDto({
    required List<CreateParticipantDto> participants,
  }) = _CreateChatDto;

  factory CreateChatDto.fromJson(Map<String, dynamic> json) =>
      _$CreateChatDtoFromJson(json);
}

@freezed
class CreateParticipantDto with _$CreateParticipantDto {
  const factory CreateParticipantDto({
    required CreateUserDto user,
  }) = _CreateParticipantDto;

  factory CreateParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$CreateParticipantDtoFromJson(json);
}

@freezed
class CreateUserDto with _$CreateUserDto {
  const factory CreateUserDto({
    required String fullName,
    required String email,
  }) = _CreateUserDto;

  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);
}

@freezed
class UpdateChatDto with _$UpdateChatDto {
  const factory UpdateChatDto({
    required String email,
    required String password,
    required String fullName,
  }) = _UpdateChatDto;

  factory UpdateChatDto.fromJson(Map<String, Object?> json) =>
      _$UpdateChatDtoFromJson(json);
}
