import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_link_request.g.dart';

@JsonSerializable()
class CreateLinkRequest {
  @JsonKey(name: 'original_url')
  final String originalUrl;

  @JsonKey(name: 'custom_alias')
  final String? customAlias;

  final String? title;

  const CreateLinkRequest({
    required this.originalUrl,
    this.customAlias,
    this.title,
  });

  factory CreateLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateLinkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLinkRequestToJson(this);
}