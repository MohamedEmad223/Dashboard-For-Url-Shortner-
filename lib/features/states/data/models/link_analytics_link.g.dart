// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_analytics_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAnalyticsLink _$LinkAnalyticsLinkFromJson(Map<String, dynamic> json) =>
    LinkAnalyticsLink(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      shortCode: json['short_code'] as String,
      originalUrl: json['original_url'] as String,
      isActive: (json['is_active'] as num).toInt(),
      totalClicks: (json['total_clicks'] as num).toInt(),
    );

Map<String, dynamic> _$LinkAnalyticsLinkToJson(LinkAnalyticsLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'short_code': instance.shortCode,
      'original_url': instance.originalUrl,
      'is_active': instance.isActive,
      'total_clicks': instance.totalClicks,
    };
