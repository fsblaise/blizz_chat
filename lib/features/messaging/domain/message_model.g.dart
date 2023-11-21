// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['id'] as String,
      json['from'] as String,
      json['text'] as String,
      json['timestamp'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
