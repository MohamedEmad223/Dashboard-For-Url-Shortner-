

import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_out_model_request.g.dart';

@JsonSerializable()
class LogOutModelRequest {

  final String token;

  LogOutModelRequest({
    required this.token,
  });

  factory LogOutModelRequest.fromJson(Map<String, dynamic> json) =>
      _$LogOutModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogOutModelRequestToJson(this);

}