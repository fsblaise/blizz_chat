import 'package:freezed_annotation/freezed_annotation.dart';
part 'story_dtos.freezed.dart';
part 'story_dtos.g.dart';

@freezed
class CreateStoryDto with _$CreateStoryDto {
  const factory CreateStoryDto({
    required String email,
    required String password,
    required String fullName,
  }) = _CreateStoryDto;

  factory CreateStoryDto.fromJson(Map<String, Object?> json) =>
      _$CreateStoryDtoFromJson(json);
}
