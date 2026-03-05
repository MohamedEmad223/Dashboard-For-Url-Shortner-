// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clicks_over_time_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClicksOverTimeData _$ClicksOverTimeDataFromJson(Map<String, dynamic> json) =>
    ClicksOverTimeData(
      period: json['period'] as String,
      clicksOverTime: (json['clicks_over_time'] as List<dynamic>)
          .map((e) => ClicksItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      comparison: json['comparison'] == null
          ? null
          : Comparison.fromJson(json['comparison'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClicksOverTimeDataToJson(ClicksOverTimeData instance) =>
    <String, dynamic>{
      'period': instance.period,
      'clicks_over_time': instance.clicksOverTime,
      'comparison': instance.comparison,
    };
