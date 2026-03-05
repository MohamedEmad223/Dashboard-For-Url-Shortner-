import 'package:json_annotation/json_annotation.dart';

import 'recent_click_item.dart';

part 'recent_clicks_response.g.dart';

@JsonSerializable()
class RecentClicksResponse {
  final String message;
  final String status;
  final List<RecentClickItem> data;

  RecentClicksResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory RecentClicksResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentClicksResponseFromJson(json);
}

