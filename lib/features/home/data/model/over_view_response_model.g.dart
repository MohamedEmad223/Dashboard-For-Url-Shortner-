// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_view_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverViewResponseModel _$OverViewResponseModelFromJson(
  Map<String, dynamic> json,
) => OverViewResponseModel(
  message: json['message'] as String,
  status: json['status'] as String,
  data: AnalyticsOverviewDataModel.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$OverViewResponseModelToJson(
  OverViewResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
};

AnalyticsOverviewDataModel _$AnalyticsOverviewDataModelFromJson(
  Map<String, dynamic> json,
) => AnalyticsOverviewDataModel(
  totalLinks: (json['total_links'] as num).toInt(),
  activeLink: (json['active_link'] as num?)?.toInt(),
  activeLinks: (json['active_links'] as num?)?.toInt(),
  inactiveLink: (json['inactive_link'] as num?)?.toInt(),
  inactiveLinks: (json['inactive_links'] as num?)?.toInt(),
  totalClicks: (json['total_clicks'] as num).toInt(),
  uniqueClicks: (json['unique_clicks'] as num?)?.toInt(),
  bestPerformingLink: json['best_performing_link'] == null
      ? null
      : LinkAnalyticsModel.fromJson(
          json['best_performing_link'] as Map<String, dynamic>,
        ),
  topFiveLinks: (json['top_five_links'] as List<dynamic>?)
      ?.map((e) => LinkAnalyticsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  peakHours: (json['peak_hours'] as List<dynamic>?)
      ?.map((e) => PeakHourModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  topReferrers: (json['top_referrers'] as List<dynamic>?)
      ?.map((e) => TopReferrerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AnalyticsOverviewDataModelToJson(
  AnalyticsOverviewDataModel instance,
) => <String, dynamic>{
  'total_links': instance.totalLinks,
  'active_link': instance.activeLink,
  'active_links': instance.activeLinks,
  'inactive_link': instance.inactiveLink,
  'inactive_links': instance.inactiveLinks,
  'total_clicks': instance.totalClicks,
  'unique_clicks': instance.uniqueClicks,
  'best_performing_link': instance.bestPerformingLink,
  'top_five_links': instance.topFiveLinks,
  'peak_hours': instance.peakHours,
  'top_referrers': instance.topReferrers,
};

LinkAnalyticsModel _$LinkAnalyticsModelFromJson(Map<String, dynamic> json) =>
    LinkAnalyticsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      shortCode: json['short_code'] as String,
      originalUrl: json['original_url'] as String,
      clicks: (json['clicks'] as num).toInt(),
    );

Map<String, dynamic> _$LinkAnalyticsModelToJson(LinkAnalyticsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'short_code': instance.shortCode,
      'original_url': instance.originalUrl,
      'clicks': instance.clicks,
    };

PeakHourModel _$PeakHourModelFromJson(Map<String, dynamic> json) =>
    PeakHourModel(
      hour: (json['hour'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PeakHourModelToJson(PeakHourModel instance) =>
    <String, dynamic>{'hour': instance.hour, 'total': instance.total};

TopReferrerModel _$TopReferrerModelFromJson(Map<String, dynamic> json) =>
    TopReferrerModel(
      referrer: json['referrer'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$TopReferrerModelToJson(TopReferrerModel instance) =>
    <String, dynamic>{'referrer': instance.referrer, 'total': instance.total};
