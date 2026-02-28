// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_analytics_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAnalyticsResponseData _$LinkAnalyticsResponseDataFromJson(
  Map<String, dynamic> json,
) => LinkAnalyticsResponseData(
  link: LinkAnalyticsLink.fromJson(json['link'] as Map<String, dynamic>),
  analytics: json['analytics'] == null
      ? null
      : LinkAnalyticsData.fromJson(json['analytics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LinkAnalyticsResponseDataToJson(
  LinkAnalyticsResponseData instance,
) => <String, dynamic>{'link': instance.link, 'analytics': instance.analytics};
