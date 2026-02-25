import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  final String message;
  final int status;
  final List<dynamic> data;

  ForgetPasswordResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ForgetPasswordResponseModelToJson(this);
}