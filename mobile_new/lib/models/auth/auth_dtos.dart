import 'package:blizz_chat/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

@freezed
class SignUpDto with _$SignUpDto {
  const factory SignUpDto({
    required String email,
    required String password,
    required String fullName,
  }) = _SignUpDto;

  factory SignUpDto.fromJson(Map<String, Object?> json) =>
      _$SignUpDtoFromJson(json);
}

@freezed
class SignInDto with _$SignInDto {
  const factory SignInDto({
    required String email,
    required String password,
  }) = _SignInDto;

  factory SignInDto.fromJson(Map<String, Object?> json) =>
      _$SignInDtoFromJson(json);
}

@freezed
class AuthResponseDto with _$AuthResponseDto {
  const factory AuthResponseDto({
    required String token,
    required User user,
  }) = _AuthResponseDto;

  factory AuthResponseDto.fromJson(Map<String, Object?> json) =>
      _$AuthResponseDtoFromJson(json);
}
