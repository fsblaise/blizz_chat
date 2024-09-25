// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'libsignal_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareKeysDtoImpl _$$ShareKeysDtoImplFromJson(Map<String, dynamic> json) =>
    _$ShareKeysDtoImpl(
      regId: (json['regId'] as num).toInt(),
      identityPublicKey:
          uint8ListFromJson(json['identityPublicKey'] as Map<String, dynamic>),
      preKeyIds: (json['preKeyIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      preKeys: uint8ListListFromJson(json['preKeys'] as List),
      signedId: (json['signedId'] as num).toInt(),
      signedPublicKey:
          uint8ListFromJson(json['signedPublicKey'] as Map<String, dynamic>),
      signedKeySignature:
          uint8ListFromJson(json['signedKeySignature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShareKeysDtoImplToJson(_$ShareKeysDtoImpl instance) =>
    <String, dynamic>{
      'regId': instance.regId,
      'identityPublicKey': uint8ListToJson(instance.identityPublicKey),
      'preKeyIds': instance.preKeyIds,
      'preKeys': uint8ListListToJson(instance.preKeys),
      'signedId': instance.signedId,
      'signedPublicKey': uint8ListToJson(instance.signedPublicKey),
      'signedKeySignature': uint8ListToJson(instance.signedKeySignature),
    };

_$KeysDtoImpl _$$KeysDtoImplFromJson(Map<String, dynamic> json) =>
    _$KeysDtoImpl(
      regId: (json['regId'] as num).toInt(),
      identityPublicKey:
          uint8ListFromJson(json['identityPublicKey'] as Map<String, dynamic>),
      preKeyIds: (json['preKeyIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      preKeys: uint8ListListFromJson(json['preKeys'] as List),
      signedId: (json['signedId'] as num).toInt(),
      signedPublicKey:
          uint8ListFromJson(json['signedPublicKey'] as Map<String, dynamic>),
      signedKeySignature:
          uint8ListFromJson(json['signedKeySignature'] as Map<String, dynamic>),
      email: json['email'] as String,
    );

Map<String, dynamic> _$$KeysDtoImplToJson(_$KeysDtoImpl instance) =>
    <String, dynamic>{
      'regId': instance.regId,
      'identityPublicKey': uint8ListToJson(instance.identityPublicKey),
      'preKeyIds': instance.preKeyIds,
      'preKeys': uint8ListListToJson(instance.preKeys),
      'signedId': instance.signedId,
      'signedPublicKey': uint8ListToJson(instance.signedPublicKey),
      'signedKeySignature': uint8ListToJson(instance.signedKeySignature),
      'email': instance.email,
    };
