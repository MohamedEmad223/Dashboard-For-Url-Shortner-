import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  final dynamic message;
  final dynamic status;
  final dynamic data;

  ForgetPasswordResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ForgetPasswordResponseModelToJson(this);

  /// Helper method to extract user-friendly error message
  String get errorMessage {
    // If message is a Map (validation errors)
    if (message is Map<String, dynamic>) {
      final map = message as Map<String, dynamic>;
      return map.values
          .whereType<List>()
          .expand((e) => e)
          .map((e) => e.toString())
          .join('\n');
    }
    // If message is a String
    if (message is String) {
      return message as String;
    }
    return 'An error occurred';
  }
}