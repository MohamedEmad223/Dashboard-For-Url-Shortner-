// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_clicks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentClicksResponse _$RecentClicksResponseFromJson(
  Map<String, dynamic> json,
) => RecentClicksResponse(
  message: json['message'] as String,
  status: json['status'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => RecentClickItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecentClicksResponseToJson(
  RecentClicksResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
