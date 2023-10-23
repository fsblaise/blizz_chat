// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FbUser _$FbUserFromJson(Map<String, dynamic> json) => FbUser(
      json['email'] as String,
      json['created'] as String,
      json['fullName'] as String,
    )
      ..id = json['id'] as String
      ..profileURL = json['profileURL'] as String
      ..contacts = Map<String, String>.from(json['contacts'] as Map)
      ..location = json['location'] as Map<String, dynamic>
      ..settings = json['settings'] as Map<String, dynamic>;

Map<String, dynamic> _$FbUserToJson(FbUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'created': instance.created,
      'fullName': instance.fullName,
      'profileURL': instance.profileURL,
      'contacts': instance.contacts,
      'location': instance.location,
      'settings': instance.settings,
    };
