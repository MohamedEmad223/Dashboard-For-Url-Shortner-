// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peak_hour_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeakHourItem _$PeakHourItemFromJson(Map<String, dynamic> json) => PeakHourItem(
  hour: (json['hour'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PeakHourItemToJson(PeakHourItem instance) =>
    <String, dynamic>{'hour': instance.hour, 'total': instance.total};
