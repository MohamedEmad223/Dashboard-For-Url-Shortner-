import 'package:json_annotation/json_annotation.dart';

part 'link_model.g.dart';

// ── Single link entity ──────────────────────────────────────────────────────

@JsonSerializable()
class LinkModel {
  final int id;

  @JsonKey(name: 'is_active')
  final String isActive;

  @JsonKey(name: 'original_link')
  final String originalLink;

  @JsonKey(name: 'short_code')
  final String shortCode;

  final String? title;

  @JsonKey(name: 'clicks_count')
  final int clicksCount;

  const LinkModel({
    required this.id,
    required this.isActive,
    required this.originalLink,
    required this.shortCode,
    this.title,
    required this.clicksCount,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}