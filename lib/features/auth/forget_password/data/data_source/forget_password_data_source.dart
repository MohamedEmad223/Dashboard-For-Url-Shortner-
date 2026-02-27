
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'forget_password_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ForgetPasswordDataSource {
  factory ForgetPasswordDataSource(Dio dio, {String baseUrl}) = _ForgetPasswordDataSource;

  @POST(EndPoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword({
    @Body() required ForgetPasswordRequestModel forgetPasswordRequestModel,
  });

  @POST(EndPoints.verifyCode)
  @FormUrlEncoded()
  Future<VerifyCodeResponseModel> verifyCode({
    @Field('email') required String email,
    @Field('code') required String code,
  });

  @POST(EndPoints.resetPassword)
  @FormUrlEncoded()
  Future<ResetPasswordResponseModel> resetPassword({

    @Field('password') required String password,
    @Field('password_confirmation') required String passwordConfirmation,
    @Field('verify_token') required String verifyToken,

  });
}