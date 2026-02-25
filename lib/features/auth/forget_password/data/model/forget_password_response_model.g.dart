// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordResponseModel(
  message: json['message'] as String,
  status: (json['status'] as num).toInt(),
  data: json['data'] as List<dynamic>,
);

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
  ForgetPasswordResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};
