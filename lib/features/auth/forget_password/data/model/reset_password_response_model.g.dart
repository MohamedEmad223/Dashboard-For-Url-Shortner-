// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModel _$ResetPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseModel(
  message: json['message'],
  status: json['status'],
  data: ResetPasswordResponseModel._dataFromJson(json['data']),
);

Map<String, dynamic> _$ResetPasswordResponseModelToJson(
  ResetPasswordResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
