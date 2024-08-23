// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      user: CreateUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateParticipantDtoImplToJson(
        _$CreateParticipantDtoImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

_$CreateUserDtoImpl _$$CreateUserDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateUserDtoImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$CreateUserDtoImplToJson(_$CreateUserDtoImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
    };

_$UpdateChatDtoImpl _$$UpdateChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateChatDtoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$UpdateChatDtoImplToJson(_$UpdateChatDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
    };
