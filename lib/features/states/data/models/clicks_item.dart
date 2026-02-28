import 'package:json_annotation/json_annotation.dart';

part 'clicks_item.g.dart';

@JsonSerializable()
class ClicksItem {
  final String date;
  final int clicks;

  ClicksItem({
    required this.date,
    required this.clicks,
  });

  factory ClicksItem.fromJson(Map<String, dynamic> json) =>
      _$ClicksItemFromJson(json);
}