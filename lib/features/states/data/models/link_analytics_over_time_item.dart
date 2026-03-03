import 'package:json_annotation/json_annotation.dart';

part 'link_analytics_over_time_item.g.dart';

@JsonSerializable()
class LinkAnalyticsOverTimeItem {
  final String date;
  final int total;

  LinkAnalyticsOverTimeItem({required this.date, required this.total});

  factory LinkAnalyticsOverTimeItem.fromJson(Map<String, dynamic> json) =>
      _$LinkAnalyticsOverTimeItemFromJson(json);
}

