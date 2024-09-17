// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddContactDtoImpl _$$AddContactDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddContactDtoImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$AddContactDtoImplToJson(_$AddContactDtoImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
    };

_$UserStatusDtoImpl _$$UserStatusDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserStatusDtoImpl(
      userId: json['userId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UserStatusDtoImplToJson(_$UserStatusDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': instance.status,
    };
