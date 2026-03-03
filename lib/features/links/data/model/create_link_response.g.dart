// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLinkResponse _$CreateLinkResponseFromJson(Map<String, dynamic> json) =>
    CreateLinkResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      data: LinkModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateLinkResponseToJson(CreateLinkResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
