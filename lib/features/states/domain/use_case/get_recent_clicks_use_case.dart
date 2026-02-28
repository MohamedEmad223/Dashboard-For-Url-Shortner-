import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/recent_clicks_response.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/repo/states_repo.dart';

class GetRecentClicksUseCase {
  final StatesRepo _repo;
  const GetRecentClicksUseCase(this._repo);

  Future<ApiResult<RecentClicksResponse>> call({int? limit}) =>
      _repo.getRecentClicks(limit: limit);
}

