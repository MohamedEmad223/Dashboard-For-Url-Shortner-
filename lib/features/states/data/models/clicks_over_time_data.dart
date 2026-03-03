import 'package:json_annotation/json_annotation.dart';

import 'clicks_item.dart';
import 'comparison.dart';


part 'clicks_over_time_data.g.dart';

@JsonSerializable()
class ClicksOverTimeData {
  final String period;

  @JsonKey(name: "clicks_over_time")
  final List<ClicksItem> clicksOverTime;

  final Comparison? comparison;

  ClicksOverTimeData({
    required this.period,
    required this.clicksOverTime,
    this.comparison,
  });

  factory ClicksOverTimeData.fromJson(Map<String, dynamic> json) =>
      _$ClicksOverTimeDataFromJson(json);
}