import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String? lastMessage,
    required List<Participant> participants,
    required bool isChatOnline,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String email,
    required String fullName,
    required String nickname,
    required bool isOnline,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
