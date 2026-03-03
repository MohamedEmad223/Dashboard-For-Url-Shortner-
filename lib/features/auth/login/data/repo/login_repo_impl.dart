import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/exception_helper_methods.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/data_source/login_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_user_data.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/repos/login_repo.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginDataSource _loginDataSource;

  LoginRepoImpl(this._loginDataSource);

  @override
  Future<ApiResult<LoginResponseModel>> login(LoginUserData loginUserData) async {
    try {
      final response = await _loginDataSource.login(loginBody: loginUserData);
      CacheHelper.setSecureData(key: ApiConstants.accessToken, value: response.data.accessToken);
      return ApiResult.success(response);
    } on ApiException catch (e) {
      return ApiResult.failure(e.apiErrorModel);
    } on DioException catch (e) {
      ExceptionHelperMethods.handle(e);
      return ApiResult.failure(
        ApiErrorModel(message: 'Un Excpected Error', statusCode: 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
}

