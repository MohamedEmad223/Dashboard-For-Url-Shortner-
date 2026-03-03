// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clicks_over_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClicksOverTimeResponse _$ClicksOverTimeResponseFromJson(
  Map<String, dynamic> json,
) => ClicksOverTimeResponse(
  message: json['message'] as String,
  status: json['status'] as String,
  data: ClicksOverTimeData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ClicksOverTimeResponseToJson(
  ClicksOverTimeResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
