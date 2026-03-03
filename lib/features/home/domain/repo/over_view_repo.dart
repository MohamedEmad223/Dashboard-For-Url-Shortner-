import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';

abstract class OverViewRepo {
  Future<ApiResult<OverViewResponseModel>> overView();
}