import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_model_request.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'log_out_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LogOutDataSource {
  factory LogOutDataSource(Dio dio, {String baseUrl}) = _LogOutDataSource;

  @POST(EndPoints.logOut)
  Future<LogOutResponseModel> logOut();
}