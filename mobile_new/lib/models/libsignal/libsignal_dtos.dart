// ignore_for_file: invalid_annotation_target

import 'dart:convert';
import 'dart:typed_data';

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

Uint8List uint8ListFromJson(Map<String, dynamic> json) =>
    Uint8List.fromList(List<int>.from(json['data']));

Map<String, dynamic> uint8ListToJson(Uint8List data) =>
    {'type': 'Buffer', 'data': data};

List<Uint8List> uint8ListListFromJson(List<dynamic> json) =>
    json.map((e) => uint8ListFromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> uint8ListListToJson(List<Uint8List> data) =>
    data.map((e) => uint8ListToJson(e)).toList();
