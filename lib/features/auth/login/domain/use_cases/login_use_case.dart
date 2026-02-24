import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_user_data.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/repos/login_repo.dart';

class LoginUseCase {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  Future<ApiResult<LoginResponseModel>> call(LoginUserData loginUserData) {
    return _loginRepo.login(loginUserData);
  }
}

