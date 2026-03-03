// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comparison _$ComparisonFromJson(Map<String, dynamic> json) => Comparison(
  currentTotal: (json['current_total'] as num).toInt(),
  previousTotal: (json['previous_total'] as num).toInt(),
  growthPercentage: json['growth_percentage'] as String,
);

Map<String, dynamic> _$ComparisonToJson(Comparison instance) =>
    <String, dynamic>{
      'current_total': instance.currentTotal,
      'previous_total': instance.previousTotal,
      'growth_percentage': instance.growthPercentage,
    };
