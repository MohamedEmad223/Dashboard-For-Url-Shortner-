import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_over_time_response.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/repo/states_repo.dart';

class GetClicksOverTimeUseCase {
  final StatesRepo _clicksOverTimeRepo;
  const GetClicksOverTimeUseCase(this._clicksOverTimeRepo);

  Future<ApiResult<ClicksOverTimeResponse>> call({
    required String from,
    required String to,
  }) async {
   return await _clicksOverTimeRepo.getClicksOverTime(from: from, to: to);
  }
}
