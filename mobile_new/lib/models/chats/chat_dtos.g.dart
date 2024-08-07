// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChatDtoImpl _$$CreateChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateChatDtoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$CreateChatDtoImplToJson(_$CreateChatDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
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
