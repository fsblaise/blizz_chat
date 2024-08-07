// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateStoryDtoImpl _$$CreateStoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateStoryDtoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$CreateStoryDtoImplToJson(
        _$CreateStoryDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
    };
