import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/home/domain/repo/over_view_repo.dart';

class OverViewUseCase {
  final OverViewRepo _overViewRepo;
  OverViewUseCase(this._overViewRepo);

  Future<ApiResult<OverViewResponseModel>> call() async {
    return await _overViewRepo.overView();
  }
}