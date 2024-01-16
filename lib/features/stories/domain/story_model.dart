import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class Story {
  final String id;
  final String caption;
  final String timestamp;
  final String userId;
  final String fullName;
  final String imgUrl;

  Story(this.id, this.caption, this.timestamp, this.userId, this.fullName, this.imgUrl);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
