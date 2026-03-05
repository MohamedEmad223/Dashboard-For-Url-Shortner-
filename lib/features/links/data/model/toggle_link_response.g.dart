// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleLinkResponse _$ToggleLinkResponseFromJson(Map<String, dynamic> json) =>
    ToggleLinkResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      isActive: ToggleLinkResponse._dataFromJson(json['isActive']),
    );

Map<String, dynamic> _$ToggleLinkResponseToJson(ToggleLinkResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'isActive': instance.isActive,
    };
