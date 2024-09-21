import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dtos.freezed.dart';
part 'message_dtos.g.dart';

@freezed
class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String id,
    required List<String> to,
    required String from,
    required String message,
    required String chatId,
    required String timestamp,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
}
