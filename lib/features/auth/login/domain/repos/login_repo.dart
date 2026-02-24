import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_user_data.dart';

abstract class LoginRepo{
  Future<ApiResult<LoginResponseModel>> login(LoginUserData loginUserData);
}