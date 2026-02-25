import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';

abstract class ForgetPasswordRepo {
  Future<ApiResult<ForgetPasswordResponseModel>> sendForgetPasswordEmail(ForgetPasswordRequestModel forgetPasswordRequestModel);
}