import 'package:json_annotation/json_annotation.dart';

part 'toggle_link_response.g.dart';

@JsonSerializable()
class ToggleLinkResponse {
  final String message;
  final String status;

  @JsonKey(fromJson: _dataFromJson)
  final String? isActive;

  const ToggleLinkResponse({
    required this.message,
    required this.status,
    this.isActive,
  });

  static String? _dataFromJson(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['is_active'] as String?;
    }
    return null; // handles []
  }

  factory ToggleLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleLinkResponseToJson(this);
}