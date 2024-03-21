// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      json['id'] as String,
      (json['participants'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      json['isGroupChat'] as bool,
      json['chatName'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'isGroupChat': instance.isGroupChat,
      'chatName': instance.chatName,
      'participants': instance.participants,
    };
