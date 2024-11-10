// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      extension: json['extension'] as String,
      imgUrl: json['imgUrl'] as String,
      timestamp: json['timestamp'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'extension': instance.extension,
      'imgUrl': instance.imgUrl,
      'timestamp': instance.timestamp,
      'email': instance.email,
      'fullName': instance.fullName,
    };
