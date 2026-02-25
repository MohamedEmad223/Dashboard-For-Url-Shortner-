import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequestModel {
  @JsonKey(name: 'verify_token')
  final String verifyToken;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  ResetPasswordRequestModel({
    required this.verifyToken,
    required this.password,
    required this.passwordConfirmation,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);
}

