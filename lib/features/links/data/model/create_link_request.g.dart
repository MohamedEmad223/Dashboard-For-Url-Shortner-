// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLinkRequest _$CreateLinkRequestFromJson(Map<String, dynamic> json) =>
    CreateLinkRequest(
      originalUrl: json['original_url'] as String,
      customAlias: json['custom_alias'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CreateLinkRequestToJson(CreateLinkRequest instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
      'custom_alias': instance.customAlias,
      'title': instance.title,
    };
