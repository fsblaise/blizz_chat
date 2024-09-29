// ignore_for_file: invalid_annotation_target

import 'dart:typed_data';

import 'package:blizz_chat/models/libsignal/libsignal_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';
part 'libsignal_dtos.freezed.dart';
part 'libsignal_dtos.g.dart';

@freezed
class ShareKeysDto with _$ShareKeysDto {
  const factory ShareKeysDto({
    required int regId,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List identityPublicKey,
    required List<int> preKeyIds,
    @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
    required List<Uint8List> preKeys,
    required int signedId,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List signedPublicKey,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List signedKeySignature,
  }) = _ShareKeysDto;

  factory ShareKeysDto.fromJson(Map<String, Object?> json) =>
      _$ShareKeysDtoFromJson(json);

  static ShareKeysDto fromLibsignal(
      int registrationId,
      IdentityKeyPair identityKeyPair,
      List<PreKeyRecord> preKeys,
      SignedPreKeyRecord signedPreKey) {
    return ShareKeysDto(
      regId: registrationId,
      identityPublicKey: identityKeyPair.getPublicKey().serialize(),
      preKeyIds: preKeys.map((preKey) => preKey.id).toList(),
      preKeys: preKeys
          .map((preKey) => preKey.getKeyPair().publicKey.serialize())
          .toList(),
      signedId: signedPreKey.id,
      signedPublicKey: signedPreKey.getKeyPair().publicKey.serialize(),
      signedKeySignature: signedPreKey.signature,
    );
  }
}

@freezed
class KeysDto with _$KeysDto {
  const factory KeysDto({
    required int regId,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List identityPublicKey,
    required List<int> preKeyIds,
    @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
    required List<Uint8List> preKeys,
    required int signedId,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List signedPublicKey,
    @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
    required Uint8List signedKeySignature,
    required String email,
  }) = _KeysDto;

  factory KeysDto.fromJson(Map<String, Object?> json) =>
      _$KeysDtoFromJson(json);

  static PreKeyBundle toLibsignal(KeysDto dto) {
    final identityKey =
        IdentityKey.fromBytes(Uint8List.fromList(dto.identityPublicKey), 0);
    final preKeyPublicKeyId = dto.preKeyIds.first;
    final preKeyPublicKey =
        Curve.decodePoint(Uint8List.fromList(dto.preKeys.first), 0);
    final signedPreKey =
        Curve.decodePoint(Uint8List.fromList(dto.signedPublicKey), 0);

    return PreKeyBundle(
      dto.regId,
      1, // deviceId
      preKeyPublicKeyId,
      preKeyPublicKey,
      dto.signedId,
      signedPreKey,
      dto.signedKeySignature,
      identityKey,
    );
  }
}

@freezed
class ShareDistributionKeyDto with _$ShareDistributionKeyDto {
  const factory ShareDistributionKeyDto({
    @JsonKey(fromJson: uint8ListFromJsonWs, toJson: uint8ListToJsonWs)
    required Uint8List key,
    required String senderEmail,
    required String groupId,
    required int messageType,
    required List<String> to,
  }) = _ShareDistributionKeyDto;

  factory ShareDistributionKeyDto.fromJson(Map<String, dynamic> json) =>
      _$ShareDistributionKeyDtoFromJson(json);
}

@freezed
class DistributionKeyDto with _$DistributionKeyDto {
  const factory DistributionKeyDto({
    @JsonKey(fromJson: uint8ListFromJsonWs, toJson: uint8ListToJsonWs)
    required Uint8List key,
    required String senderEmail,
    required String groupId,
    required int messageType,
    required String to,
  }) = _DistributionKeyDto;

  factory DistributionKeyDto.fromJson(Map<String, dynamic> json) =>
      _$DistributionKeyDtoFromJson(json);
}
