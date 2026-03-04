// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_click_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentClickLink _$RecentClickLinkFromJson(Map<String, dynamic> json) =>
    RecentClickLink(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      shortCode: json['short_code'] as String,
    );

Map<String, dynamic> _$RecentClickLinkToJson(RecentClickLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'short_code': instance.shortCode,
    };
