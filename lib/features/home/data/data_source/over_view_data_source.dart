import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';

part 'over_view_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OverViewDataSource {
  factory OverViewDataSource(Dio dio, {String baseUrl}) = _OverViewDataSource;

  @GET(EndPoints.overView)
  Future<OverViewResponseModel> overView();
}