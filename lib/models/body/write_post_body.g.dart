// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_post_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WritePostBody _$WritePostBodyFromJson(Map<String, dynamic> json) =>
    WritePostBody(
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$WritePostBodyToJson(WritePostBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'user_id': instance.userId,
    };
