// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_links_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLinksResponse _$GetLinksResponseFromJson(Map<String, dynamic> json) =>
    GetLinksResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLinksResponseToJson(GetLinksResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{'message': instance.message, 'status': instance.status};
