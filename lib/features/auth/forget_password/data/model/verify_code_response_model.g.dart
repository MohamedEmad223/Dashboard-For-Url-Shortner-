// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResponseModel _$VerifyCodeResponseModelFromJson(
  Map<String, dynamic> json,
) => VerifyCodeResponseModel(
  message: json['message'],
  status: json['status'],
  data: VerifyCodeResponseModel._dataFromJson(json['data']),
);

Map<String, dynamic> _$VerifyCodeResponseModelToJson(
  VerifyCodeResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};

VerifyCodeData _$VerifyCodeDataFromJson(Map<String, dynamic> json) =>
    VerifyCodeData(verifyToken: json['verify_token'] as String);

Map<String, dynamic> _$VerifyCodeDataToJson(VerifyCodeData instance) =>
    <String, dynamic>{'verify_token': instance.verifyToken};
