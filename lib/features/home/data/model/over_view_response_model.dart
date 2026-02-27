import 'package:json_annotation/json_annotation.dart';

part 'over_view_response_model.g.dart';

@JsonSerializable()
class OverViewResponseModel {
  final String message;
  final String status;
  final AnalyticsOverviewDataModel data;

  OverViewResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory OverViewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OverViewResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OverViewResponseModelToJson(this);
}



@JsonSerializable()
class AnalyticsOverviewDataModel {
  @JsonKey(name: 'total_links')
  final int totalLinks;

  @JsonKey(name: 'active_link')
  final int? activeLink;

  @JsonKey(name: 'active_links')
  final int? activeLinks;

  @JsonKey(name: 'inactive_link')
  final int? inactiveLink;

  @JsonKey(name: 'inactive_links')
  final int? inactiveLinks;

  @JsonKey(name: 'total_clicks')
  final int totalClicks;

  @JsonKey(name: 'unique_clicks')
  final int? uniqueClicks;

  @JsonKey(name: 'best_performing_link')
  final LinkAnalyticsModel? bestPerformingLink;

  @JsonKey(name: 'top_five_links')
  final List<LinkAnalyticsModel>? topFiveLinks;

  @JsonKey(name: 'peak_hours')
  final List<PeakHourModel>? peakHours;

  @JsonKey(name: 'top_referrers')
  final List<TopReferrerModel>? topReferrers;

  AnalyticsOverviewDataModel({
    required this.totalLinks,
    this.activeLink,
    this.activeLinks,
    this.inactiveLink,
    this.inactiveLinks,
    required this.totalClicks,
    this.uniqueClicks,
    this.bestPerformingLink,
    this.topFiveLinks,
    this.peakHours,
    this.topReferrers,
  });

  factory AnalyticsOverviewDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsOverviewDataModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AnalyticsOverviewDataModelToJson(this);
}

@JsonSerializable()
class LinkAnalyticsModel {
  final int id;
  final String title;

  @JsonKey(name: 'short_code')
  final String shortCode;

  @JsonKey(name: 'original_url')
  final String originalUrl;

  final int clicks;

  LinkAnalyticsModel({
    required this.id,
    required this.title,
    required this.shortCode,
    required this.originalUrl,
    required this.clicks,
  });

  factory LinkAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LinkAnalyticsModelToJson(this);
}

@JsonSerializable()
class PeakHourModel {
  final int hour;
  final int total;

  PeakHourModel({
    required this.hour,
    required this.total,
  });

  factory PeakHourModel.fromJson(Map<String, dynamic> json) =>
      _$PeakHourModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PeakHourModelToJson(this);
}

@JsonSerializable()
class TopReferrerModel {
  final String referrer;
  final int total;

  TopReferrerModel({
    required this.referrer,
    required this.total,
  });

  factory TopReferrerModel.fromJson(Map<String, dynamic> json) =>
      _$TopReferrerModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TopReferrerModelToJson(this);
}