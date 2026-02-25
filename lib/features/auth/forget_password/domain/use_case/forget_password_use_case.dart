import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/repo/forget_password_repo.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordUseCase(this._forgetPasswordRepo);

  Future<ApiResult<ForgetPasswordResponseModel>> call(ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    return await _forgetPasswordRepo.sendForgetPasswordEmail(forgetPasswordRequestModel);
  }
}