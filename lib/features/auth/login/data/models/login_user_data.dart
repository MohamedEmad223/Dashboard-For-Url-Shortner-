import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user_data.g.dart';

@JsonSerializable()
class LoginUserData {
  final String email;
  final String password;

  LoginUserData({
    required this.email,
    required this.password,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserDataToJson(this);
}