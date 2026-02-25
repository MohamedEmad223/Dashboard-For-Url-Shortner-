import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_response_model.dart';

abstract class SignUpRepo {
  Future<ApiResult<RegisterResponseModel>> signUp(RegisterRequestModel registerRequestModel);}