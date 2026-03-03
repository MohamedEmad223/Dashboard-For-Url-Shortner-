import 'package:json_annotation/json_annotation.dart';

part 'peak_hour_item.g.dart';

@JsonSerializable()
class PeakHourItem {
  final int hour;
  final int total;

  PeakHourItem({required this.hour, required this.total});

  factory PeakHourItem.fromJson(Map<String, dynamic> json) =>
      _$PeakHourItemFromJson(json);
}

