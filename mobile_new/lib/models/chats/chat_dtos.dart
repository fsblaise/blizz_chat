import 'package:blizz_chat/models/chats/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_dtos.freezed.dart';
part 'chat_dtos.g.dart';

@freezed
class ChatDto with _$ChatDto {
  const factory ChatDto({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String? lastMessage,
    required List<ParticipantDto> participants,
  }) = _ChatDto;

  factory ChatDto.fromJson(Map<String, dynamic> json) =>
      _$ChatDtoFromJson(json);

  factory ChatDto.fromChat(Chat chat) {
    return ChatDto(
      id: chat.id,
      title: chat.title,
      lastMessage: chat.lastMessage,
      participants: chat.participants
          .map(
            (p) => ParticipantDto(
              email: p.email,
              fullName: p.fullName,
              nickname: p.nickname,
            ),
          )
          .toList(),
    );
  }
}

@freezed
class ParticipantDto with _$ParticipantDto {
  const factory ParticipantDto({
    required String email,
    required String fullName,
    required String nickname,
  }) = _ParticipantDto;

  factory ParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDtoFromJson(json);
}

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
    required String fullName,
    required String email,
  }) = _CreateParticipantDto;

  factory CreateParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$CreateParticipantDtoFromJson(json);
}
