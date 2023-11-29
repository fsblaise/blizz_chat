import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class Chat {
  final String id;
  final bool isGroupChat;
  final String? chatName;
  List<Map<String, String>> participants;

  Chat(this.id, this.participants, this.isGroupChat, this.chatName);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
