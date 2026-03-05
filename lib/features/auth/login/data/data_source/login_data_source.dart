import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_user_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'login_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginDataSource {
  factory LoginDataSource(Dio dio, {String baseUrl}) = _LoginDataSource;

  @POST(EndPoints.login)
  Future<LoginResponseModel> login({
    @Body() required LoginUserData loginBody
  });
}