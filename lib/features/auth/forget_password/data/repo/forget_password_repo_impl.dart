import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:dio/dio.dart';

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
    } on ApiException catch (error) {
      return ApiResult.failure(
        ApiErrorModel(message: error.apiErrorModel.message,
            statusCode: error.apiErrorModel.statusCode),);
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
            message: e.toString(), statusCode: e.response?.statusCode ?? 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }}
