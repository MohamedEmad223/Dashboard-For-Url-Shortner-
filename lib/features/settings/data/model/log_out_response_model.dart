import 'package:json_annotation/json_annotation.dart';

part 'log_out_response_model.g.dart';

@JsonSerializable()
class LogOutResponseModel {
  final String message;
  final String? status;
  final List<dynamic>? data;

  LogOutResponseModel({
    required this.message,
    this.status,
    this.data,
  });

  factory LogOutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogOutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogOutResponseModelToJson(this);
}