// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      lastMessage: json['lastMessage'] as String?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChatOnline: json['isChatOnline'] as bool,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'lastMessage': instance.lastMessage,
      'participants': instance.participants,
      'isChatOnline': instance.isChatOnline,
    };

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'isOnline': instance.isOnline,
    };
