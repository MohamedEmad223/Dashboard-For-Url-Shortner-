import 'package:json_annotation/json_annotation.dart';

part 'analytics_count_item.g.dart';

/// Reusable model for top_countries, top_cities, browsers,
/// platforms, top_referrers — each has a label key + total.
@JsonSerializable()
class AnalyticsCountItem {
  final String? country;
  final String? city;
  final String? browser;
  final String? platform;
  final String? referrer;
  final int total;

  AnalyticsCountItem({
    this.country,
    this.city,
    this.browser,
    this.platform,
    this.referrer,
    required this.total,
  });

  factory AnalyticsCountItem.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsCountItemFromJson(json);

  /// Returns whichever label field is non-null.
  String get label =>
      country ?? city ?? browser ?? platform ?? referrer ?? '';
}

