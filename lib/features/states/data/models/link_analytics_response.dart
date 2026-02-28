import 'package:json_annotation/json_annotation.dart';

import 'link_analytics_response_data.dart';

part 'link_analytics_response.g.dart';

@JsonSerializable()
class LinkAnalyticsResponse {
  final String message;
  final String status;
  final LinkAnalyticsResponseData data;

  LinkAnalyticsResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory LinkAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsResponseFromJson(json);
}

