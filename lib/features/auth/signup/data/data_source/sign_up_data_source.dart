import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';

part 'sign_up_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignUpDataSource {
  factory SignUpDataSource(Dio dio, {String baseUrl}) = _SignUpDataSource;

  @POST(EndPoints.signUp)
  Future<RegisterResponseModel> signUp({
    @Body() required RegisterRequestModel registerBody
  });
}