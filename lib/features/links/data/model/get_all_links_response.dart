import 'package:freezed_annotation/freezed_annotation.dart';

import 'link_model.dart';

part 'get_all_links_response.g.dart';

@JsonSerializable()
class GetLinksResponse {
  final String message;
  final String status;
  final List<LinkModel> data;

  const GetLinksResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLinksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLinksResponseToJson(this);
}

// ── Delete / generic message response ────────────────────────────────────

@JsonSerializable()
class MessageResponse {
  final String message;
  final String status;

  const MessageResponse({required this.message, required this.status});

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}