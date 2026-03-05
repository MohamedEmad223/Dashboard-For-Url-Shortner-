
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart' show ApiErrorModel;
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/data_source/sign_up_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/domain/repo/sign_up_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/api/exceptions/exception_helper_methods.dart';

class SignUpRepoImpl implements SignUpRepo{

  final SignUpDataSource _signUpDataSource;
  SignUpRepoImpl(this._signUpDataSource);

  @override
  Future<ApiResult<RegisterResponseModel>> signUp(RegisterRequestModel registerResponseModel) async{
    try{
      final response = await _signUpDataSource.signUp(registerBody: registerResponseModel);

      // API returns HTTP 200 but with error status in body (e.g. 422)
      if (!response.isSuccess) {
        return ApiResult.failure(
          ApiErrorModel(
            message: response.validationErrorMessage,
            statusCode: response.status,
          ),
        );
      }

      return ApiResult.success(response);
    }on ApiException catch(e){
            return ApiResult.failure(e.apiErrorModel);

    }on DioException catch (e) {
      try {
        ExceptionHelperMethods.handle(e);
      } on ApiException catch (ae) {
        return ApiResult.failure(ae.apiErrorModel);
      }
      return ApiResult.failure(
        ApiErrorModel(message: 'Unexpected Error', statusCode: 0),
      );

    }catch(e){
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );}
  }
}