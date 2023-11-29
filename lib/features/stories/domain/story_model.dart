import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class Story {
  final String id;
  final String caption;
  final String userId;
  final String imgUrl;

  Story(this.id, this.caption, this.userId, this.imgUrl);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
