// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => LinkModel(
  id: (json['id'] as num).toInt(),
  isActive: json['is_active'] as String,
  originalLink: json['original_link'] as String,
  shortCode: json['short_code'] as String,
  title: json['title'] as String?,
  clicksCount: (json['clicks_count'] as num).toInt(),
);

Map<String, dynamic> _$LinkModelToJson(LinkModel instance) => <String, dynamic>{
  'id': instance.id,
  'is_active': instance.isActive,
  'original_link': instance.originalLink,
  'short_code': instance.shortCode,
  'title': instance.title,
  'clicks_count': instance.clicksCount,
};
