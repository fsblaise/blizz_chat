import 'package:blizz_chat/models/chats/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_dtos.freezed.dart';
part 'chat_dtos.g.dart';

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
