import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/repo/forget_password_repo.dart';

class VerifyCodeUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  VerifyCodeUseCase(this._forgetPasswordRepo);

  Future<ApiResult<VerifyCodeResponseModel>> call(VerifyCodeRequestModel verifyCodeRequestModel) async {
    return await _forgetPasswordRepo.verifyCode(verifyCodeRequestModel);
  }
}

