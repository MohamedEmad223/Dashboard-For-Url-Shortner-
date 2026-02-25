import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/repo/forget_password_repo.dart';

class ResetPasswordUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ResetPasswordUseCase(this._forgetPasswordRepo);

  Future<ApiResult<ResetPasswordResponseModel>> call(ResetPasswordRequestModel resetPasswordRequestModel) async {
    return await _forgetPasswordRepo.resetPassword(resetPasswordRequestModel);
  }
}

