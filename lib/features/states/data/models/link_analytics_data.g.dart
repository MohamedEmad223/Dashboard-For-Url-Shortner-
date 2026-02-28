// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_analytics_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAnalyticsData _$LinkAnalyticsDataFromJson(Map<String, dynamic> json) =>
    LinkAnalyticsData(
      topCountries: (json['top_countries'] as List<dynamic>)
          .map((e) => AnalyticsCountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      topCities: (json['top_cities'] as List<dynamic>)
          .map((e) => AnalyticsCountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      browsers: (json['browsers'] as List<dynamic>)
          .map((e) => AnalyticsCountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => AnalyticsCountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      peakHours: (json['peak_hours'] as List<dynamic>)
          .map((e) => PeakHourItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      topReferrers: (json['top_referrers'] as List<dynamic>)
          .map((e) => AnalyticsCountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      clicksOverTime: (json['clicks_over_time'] as List<dynamic>)
          .map(
            (e) =>
                LinkAnalyticsOverTimeItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$LinkAnalyticsDataToJson(LinkAnalyticsData instance) =>
    <String, dynamic>{
      'top_countries': instance.topCountries,
      'top_cities': instance.topCities,
      'browsers': instance.browsers,
      'platforms': instance.platforms,
      'peak_hours': instance.peakHours,
      'top_referrers': instance.topReferrers,
      'clicks_over_time': instance.clicksOverTime,
    };
