// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      json['id'] as String,
      json['caption'] as String,
      json['timestamp'] as String,
      json['userId'] as String,
      json['fullName'] as String,
      json['imgUrl'] as String,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'timestamp': instance.timestamp,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'imgUrl': instance.imgUrl,
    };
