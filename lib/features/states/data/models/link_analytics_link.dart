import 'package:json_annotation/json_annotation.dart';

part 'link_analytics_link.g.dart';

@JsonSerializable()
class LinkAnalyticsLink {
  final int id;
  final String? title;

  @JsonKey(name: 'short_code')
  final String shortCode;

  @JsonKey(name: 'original_url')
  final String originalUrl;

  @JsonKey(name: 'is_active')
  final int isActive;

  @JsonKey(name: 'total_clicks')
  final int totalClicks;

  LinkAnalyticsLink({
    required this.id,
    this.title,
    required this.shortCode,
    required this.originalUrl,
    required this.isActive,
    required this.totalClicks,
  });

  factory LinkAnalyticsLink.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsLinkFromJson(json);
}

