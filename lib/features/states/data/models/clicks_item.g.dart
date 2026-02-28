// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clicks_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClicksItem _$ClicksItemFromJson(Map<String, dynamic> json) => ClicksItem(
  date: json['date'] as String,
  clicks: (json['clicks'] as num).toInt(),
);

Map<String, dynamic> _$ClicksItemToJson(ClicksItem instance) =>
    <String, dynamic>{'date': instance.date, 'clicks': instance.clicks};
