import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_response_model.dart';
import 'package:dashboard_for_url_shortner/features/settings/domain/log_out_repo.dart';

class LogOutUseCase {
  final LogOutRepo logOutRepo;

  LogOutUseCase(this.logOutRepo);

  Future<ApiResult<LogOutResponseModel>> call(

  ) async {
    return await logOutRepo.logOut();
  }
}
