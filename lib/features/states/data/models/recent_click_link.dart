import 'package:json_annotation/json_annotation.dart';

part 'recent_click_link.g.dart';

@JsonSerializable()
class RecentClickLink {
  final int id;
  final String title;

  @JsonKey(name: 'short_code')
  final String shortCode;

  RecentClickLink({
    required this.id,
    required this.title,
    required this.shortCode,
  });

  factory RecentClickLink.fromJson(Map<String, dynamic> json) =>
      _$RecentClickLinkFromJson(json);
}

