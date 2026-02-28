import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_over_time_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/recent_clicks_response.dart';

import '../../../../core/networking/api_result.dart';

abstract class StatesRepo {
  Future<ApiResult<ClicksOverTimeResponse>> getClicksOverTime({
    required String from,
    required String to,
  });

  Future<ApiResult<RecentClicksResponse>> getRecentClicks({int? limit});

  Future<ApiResult<LinkAnalyticsResponse>> getLinkAnalytics(int linkId);
}
