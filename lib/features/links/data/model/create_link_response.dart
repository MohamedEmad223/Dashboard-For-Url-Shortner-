import 'package:freezed_annotation/freezed_annotation.dart';

import 'link_model.dart';


part 'create_link_response.g.dart';

@JsonSerializable()
class CreateLinkResponse {
  final String message;
  final String status;
  final LinkModel data;

  const CreateLinkResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory CreateLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLinkResponseToJson(this);
}