import 'package:json_annotation/json_annotation.dart';

import 'login_user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final String status;
  final LoginDataModel data;

  LoginResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginDataModel {
  @JsonKey(name: 'user')
  final LoginUserModel user;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  LoginDataModel({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}
