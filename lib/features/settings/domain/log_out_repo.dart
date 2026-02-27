import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_model_request.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_response_model.dart';

abstract class LogOutRepo {
  Future<ApiResult<LogOutResponseModel>> logOut();
}