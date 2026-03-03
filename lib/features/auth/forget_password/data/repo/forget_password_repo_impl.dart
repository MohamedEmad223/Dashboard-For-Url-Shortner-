import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/exception_helper_methods.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/repo/forget_password_repo.dart';

import '../../../../../core/errors/api/models/api_error_model.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {

    final ForgetPasswordDataSource _forgetPasswordDataSource;
    ForgetPasswordRepoImpl(this._forgetPasswordDataSource);
  @override
  Future<ApiResult<ForgetPasswordResponseModel>> sendForgetPasswordEmail(ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    try {
      final response = await _forgetPasswordDataSource.forgetPassword(
          forgetPasswordRequestModel: forgetPasswordRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      try {
        ExceptionHelperMethods.handle(e);
      } on ApiException catch (error) {
        return ApiResult.failure(
          ApiErrorModel(
            message: error.apiErrorModel.message,
            statusCode: error.apiErrorModel.statusCode,
          ),
        );
      }
      // Fallback if exception is not handled
      return ApiResult.failure(
        ApiErrorModel(message: 'An unexpected error occurred', statusCode: 0),
      );
    }
  }

  @override
  Future<ApiResult<VerifyCodeResponseModel>> verifyCode(VerifyCodeRequestModel verifyCodeRequestModel) async {
    try {
      final response = await _forgetPasswordDataSource.verifyCode(
        email: verifyCodeRequestModel.email,
        code: verifyCodeRequestModel.code,
      );

      CacheHelper.setSecureData(key: ApiConstants.verifyToken, value: response.data?.verifyToken??'There is No verify token');

      return ApiResult.success(response);
    } catch (e) {
      try {
        ExceptionHelperMethods.handle(e);
      } on ApiException catch (error) {
        return ApiResult.failure(
          ApiErrorModel(
            message: error.apiErrorModel.message,
            statusCode: error.apiErrorModel.statusCode,
          ),
        );
      }
      // Fallback if exception is not handled
      return ApiResult.failure(
        ApiErrorModel(message: 'An unexpected error occurred', statusCode: 0),
      );
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponseModel>> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel) async {
    try {
      final response = await _forgetPasswordDataSource.resetPassword(
        password: resetPasswordRequestModel.password,
        passwordConfirmation: resetPasswordRequestModel.passwordConfirmation,
        verifyToken: resetPasswordRequestModel.verifyToken,
      );

      return ApiResult.success(response);
    } catch (e) {
      try {
        ExceptionHelperMethods.handle(e);
      } on ApiException catch (error) {
        return ApiResult.failure(
          ApiErrorModel(
            message: error.apiErrorModel.message,
            statusCode: error.apiErrorModel.statusCode,
          ),
        );
      }
      // Fallback if exception is not handled
      return ApiResult.failure(
        ApiErrorModel(message: 'An unexpected error occurred', statusCode: 0),
      );
    }
  }
}
