// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_count_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsCountItem _$AnalyticsCountItemFromJson(Map<String, dynamic> json) =>
    AnalyticsCountItem(
      country: json['country'] as String?,
      city: json['city'] as String?,
      browser: json['browser'] as String?,
      platform: json['platform'] as String?,
      referrer: json['referrer'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$AnalyticsCountItemToJson(AnalyticsCountItem instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'browser': instance.browser,
      'platform': instance.platform,
      'referrer': instance.referrer,
      'total': instance.total,
    };
