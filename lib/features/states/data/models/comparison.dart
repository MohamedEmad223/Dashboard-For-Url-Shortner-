import 'package:json_annotation/json_annotation.dart';

part 'comparison.g.dart';

@JsonSerializable()
class Comparison {
  @JsonKey(name: "current_total")
  final int currentTotal;

  @JsonKey(name: "previous_total")
  final int previousTotal;

  @JsonKey(name: "growth_percentage")
  final String growthPercentage;

  Comparison({
    required this.currentTotal,
    required this.previousTotal,
    required this.growthPercentage,
  });

  factory Comparison.fromJson(Map<String, dynamic> json) =>
      _$ComparisonFromJson(json);
}