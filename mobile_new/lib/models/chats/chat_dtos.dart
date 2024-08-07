import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_dtos.freezed.dart';
part 'chat_dtos.g.dart';

@freezed
class CreateChatDto with _$CreateChatDto {
  const factory CreateChatDto({
    required String email,
    required String password,
    required String fullName,
  }) = _CreateChatDto;

  factory CreateChatDto.fromJson(Map<String, Object?> json) =>
      _$CreateChatDtoFromJson(json);
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
