import 'package:json_annotation/json_annotation.dart';

import 'analytics_count_item.dart';
import 'link_analytics_over_time_item.dart';
import 'peak_hour_item.dart';

part 'link_analytics_data.g.dart';

@JsonSerializable()
class LinkAnalyticsData {
  @JsonKey(name: 'top_countries')
  final List<AnalyticsCountItem> topCountries;

  @JsonKey(name: 'top_cities')
  final List<AnalyticsCountItem> topCities;

  final List<AnalyticsCountItem> browsers;
  final List<AnalyticsCountItem> platforms;

  @JsonKey(name: 'peak_hours')
  final List<PeakHourItem> peakHours;

  @JsonKey(name: 'top_referrers')
  final List<AnalyticsCountItem> topReferrers;

  @JsonKey(name: 'clicks_over_time')
  final List<LinkAnalyticsOverTimeItem> clicksOverTime;

  LinkAnalyticsData({
    required this.topCountries,
    required this.topCities,
    required this.browsers,
    required this.platforms,
    required this.peakHours,
    required this.topReferrers,
    required this.clicksOverTime,
  });

  factory LinkAnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsDataFromJson(json);
}

