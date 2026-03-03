import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_response.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/repo/states_repo.dart';

class GetLinkAnalyticsUseCase {
  final StatesRepo _repo;
  const GetLinkAnalyticsUseCase(this._repo);

  Future<ApiResult<LinkAnalyticsResponse>> call(int linkId) =>
      _repo.getLinkAnalytics(linkId);
}

