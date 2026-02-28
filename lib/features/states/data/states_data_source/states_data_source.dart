import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_over_time_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/recent_clicks_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/end_points.dart';

part 'states_data_source.g.dart';


@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class StatesDataSource {
  factory StatesDataSource(Dio dio, {String baseUrl}) = _StatesDataSource;

  @GET(EndPoints.clicksOverTime)
  Future<ClicksOverTimeResponse> getClicksOverTime({
    @Query("from") String? from,
    @Query("to") String? to,
  });

  @GET(EndPoints.recentClicks)
  Future<RecentClicksResponse> getRecentClicks({
    @Query('limit') int? limit,
  });

  @GET('{path}')
  Future<LinkAnalyticsResponse> getLinkAnalytics(
    @Path('path') String path,
  );
}
