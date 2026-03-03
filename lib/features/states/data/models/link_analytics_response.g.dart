// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_analytics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAnalyticsResponse _$LinkAnalyticsResponseFromJson(
  Map<String, dynamic> json,
) => LinkAnalyticsResponse(
  message: json['message'] as String,
  status: json['status'] as String,
  data: LinkAnalyticsResponseData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LinkAnalyticsResponseToJson(
  LinkAnalyticsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
