import 'package:json_annotation/json_annotation.dart';

import 'clicks_over_time_data.dart';

part 'clicks_over_time_response.g.dart';

@JsonSerializable()
class ClicksOverTimeResponse {
  final String message;
  final String status;
  final ClicksOverTimeData data;

  ClicksOverTimeResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ClicksOverTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$ClicksOverTimeResponseFromJson(json);
}