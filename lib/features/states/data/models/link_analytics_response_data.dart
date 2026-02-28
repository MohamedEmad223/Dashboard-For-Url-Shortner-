import 'package:json_annotation/json_annotation.dart';

import 'link_analytics_data.dart';
import 'link_analytics_link.dart';

part 'link_analytics_response_data.g.dart';

@JsonSerializable()
class LinkAnalyticsResponseData {
  final LinkAnalyticsLink link;

  /// Null when no clicks have been recorded yet.
  final LinkAnalyticsData? analytics;

  LinkAnalyticsResponseData({
    required this.link,
    this.analytics,
  });

  factory LinkAnalyticsResponseData.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsResponseDataFromJson(json);
}

