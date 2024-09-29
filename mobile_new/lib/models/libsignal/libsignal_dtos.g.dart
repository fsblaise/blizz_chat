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

_$ShareDistributionKeyDtoImpl _$$ShareDistributionKeyDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ShareDistributionKeyDtoImpl(
      key: uint8ListFromJsonWs(json['key']),
      senderEmail: json['senderEmail'] as String,
      groupId: json['groupId'] as String,
      messageType: (json['messageType'] as num).toInt(),
      to: (json['to'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ShareDistributionKeyDtoImplToJson(
        _$ShareDistributionKeyDtoImpl instance) =>
    <String, dynamic>{
      'key': uint8ListToJsonWs(instance.key),
      'senderEmail': instance.senderEmail,
      'groupId': instance.groupId,
      'messageType': instance.messageType,
      'to': instance.to,
    };

_$DistributionKeyDtoImpl _$$DistributionKeyDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DistributionKeyDtoImpl(
      key: uint8ListFromJsonWs(json['key']),
      senderEmail: json['senderEmail'] as String,
      groupId: json['groupId'] as String,
      messageType: (json['messageType'] as num).toInt(),
      to: json['to'] as String,
    );

Map<String, dynamic> _$$DistributionKeyDtoImplToJson(
        _$DistributionKeyDtoImpl instance) =>
    <String, dynamic>{
      'key': uint8ListToJsonWs(instance.key),
      'senderEmail': instance.senderEmail,
      'groupId': instance.groupId,
      'messageType': instance.messageType,
      'to': instance.to,
    };
