import 'package:json_annotation/json_annotation.dart';

import 'recent_click_link.dart';

part 'recent_click_item.g.dart';

@JsonSerializable()
class RecentClickItem {
  final int id;

  @JsonKey(name: 'link_id')
  final int linkId;

  final String? country;
  final String? city;

  @JsonKey(name: 'device_type')
  final String? deviceType;

  final String? browser;
  final String? platform;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final RecentClickLink link;

  RecentClickItem({
    required this.id,
    required this.linkId,
    this.country,
    this.city,
    this.deviceType,
    this.browser,
    this.platform,
    required this.createdAt,
    required this.link,
  });

  factory RecentClickItem.fromJson(Map<String, dynamic> json) =>
      _$RecentClickItemFromJson(json);
}

