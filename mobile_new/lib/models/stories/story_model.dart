import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String caption,
    required String extension,
    required String imgUrl,
    required String timestamp,
    required String email,
    required String fullName,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
