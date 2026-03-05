import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  final dynamic message;
  final dynamic status;
  @JsonKey(fromJson: _dataFromJson)
  final dynamic data;

  ResetPasswordResponseModel({
    required this.message,
    required this.status,
    this.data,
  });

  static dynamic _dataFromJson(dynamic json) {
    if (json == null) return null;
    if (json is List) return null; // Handle empty array []
    if (json is Map<String, dynamic>) return json;
    return null;
  }

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseModelToJson(this);
}

