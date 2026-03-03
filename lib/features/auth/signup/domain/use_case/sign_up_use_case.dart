import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/domain/repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<ApiResult<RegisterResponseModel>> call(
      RegisterRequestModel registerRequestModel
      ) async {
    return await signUpRepo.signUp(registerRequestModel);
  }
}