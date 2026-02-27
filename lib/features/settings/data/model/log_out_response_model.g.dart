// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_out_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogOutResponseModel _$LogOutResponseModelFromJson(Map<String, dynamic> json) =>
    LogOutResponseModel(
      message: json['message'] as String,
      status: json['status'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$LogOutResponseModelToJson(
  LogOutResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
