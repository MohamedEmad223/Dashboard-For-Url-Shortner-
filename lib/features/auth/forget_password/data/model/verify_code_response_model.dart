import 'package:json_annotation/json_annotation.dart';

part 'verify_code_response_model.g.dart';

@JsonSerializable()
class VerifyCodeResponseModel {
  final dynamic message;
  final dynamic status;
  @JsonKey(fromJson: _dataFromJson)
  final VerifyCodeData? data;

  VerifyCodeResponseModel({
    required this.message,
    required this.status,
    this.data,
  });

  static VerifyCodeData? _dataFromJson(dynamic json) {
    if (json == null) return null;
    if (json is List) return null; // Handle empty array []
    if (json is Map<String, dynamic>) {
      return VerifyCodeData.fromJson(json);
    }
    return null;
  }

  factory VerifyCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseModelToJson(this);
}

@JsonSerializable()
class VerifyCodeData {
  @JsonKey(name: 'verify_token')
  final String verifyToken;

  VerifyCodeData({
    required this.verifyToken,
  });

  factory VerifyCodeData.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeDataToJson(this);
}

