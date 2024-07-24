// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpDtoImpl _$$SignUpDtoImplFromJson(Map<String, dynamic> json) =>
    _$SignUpDtoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$SignUpDtoImplToJson(_$SignUpDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
    };

_$SignInDtoImpl _$$SignInDtoImplFromJson(Map<String, dynamic> json) =>
    _$SignInDtoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$SignInDtoImplToJson(_$SignInDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
