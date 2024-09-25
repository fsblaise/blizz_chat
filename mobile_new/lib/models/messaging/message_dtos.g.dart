// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDtoImpl _$$MessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$MessageDtoImpl(
      id: json['id'] as String,
      to: (json['to'] as List<dynamic>).map((e) => e as String).toList(),
      from: json['from'] as String,
      message: json['message'] as String,
      messageType: (json['messageType'] as num).toInt(),
      chatId: json['chatId'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$MessageDtoImplToJson(_$MessageDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'to': instance.to,
      'from': instance.from,
      'message': instance.message,
      'messageType': instance.messageType,
      'chatId': instance.chatId,
      'timestamp': instance.timestamp,
    };
