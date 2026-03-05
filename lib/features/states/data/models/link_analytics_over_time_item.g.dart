// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_analytics_over_time_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAnalyticsOverTimeItem _$LinkAnalyticsOverTimeItemFromJson(
  Map<String, dynamic> json,
) => LinkAnalyticsOverTimeItem(
  date: json['date'] as String,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$LinkAnalyticsOverTimeItemToJson(
  LinkAnalyticsOverTimeItem instance,
) => <String, dynamic>{'date': instance.date, 'total': instance.total};
