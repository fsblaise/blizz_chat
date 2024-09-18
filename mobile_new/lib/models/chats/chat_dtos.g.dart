// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatDtoImpl _$$ChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatDtoImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      lastMessage: json['lastMessage'] as String?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ParticipantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatDtoImplToJson(_$ChatDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'lastMessage': instance.lastMessage,
      'participants': instance.participants,
    };

_$ParticipantDtoImpl _$$ParticipantDtoImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantDtoImpl(
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$ParticipantDtoImplToJson(
        _$ParticipantDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
    };

_$CreateChatDtoImpl _$$CreateChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateChatDtoImpl(
      participants: (json['participants'] as List<dynamic>)
          .map((e) => CreateParticipantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateChatDtoImplToJson(_$CreateChatDtoImpl instance) =>
    <String, dynamic>{
      'participants': instance.participants,
    };

_$CreateParticipantDtoImpl _$$CreateParticipantDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateParticipantDtoImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$CreateParticipantDtoImplToJson(
        _$CreateParticipantDtoImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
    };
