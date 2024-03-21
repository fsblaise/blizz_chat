import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String from;
  final String text;
  final String timestamp;

  Message(this.id, this.from, this.text, this.timestamp);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
