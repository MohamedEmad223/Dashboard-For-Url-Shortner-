import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/data_source/log_out_data_source.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_model_request.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_response_model.dart';
import 'package:dashboard_for_url_shortner/features/settings/domain/log_out_repo.dart';
import 'package:dio/dio.dart';

class LogOutRepoImpl implements LogOutRepo {
  final LogOutDataSource _logOutDataSource;
  LogOutRepoImpl(this._logOutDataSource);
  @override
  Future<ApiResult<LogOutResponseModel>> logOut(

  ) async {
    try {
      final response = await _logOutDataSource.logOut(

      );
      return ApiResult.success(response);
    } on ApiException catch (error) {
      return ApiResult.failure(
        ApiErrorModel(
          message: error.apiErrorModel.message,
          statusCode: error.apiErrorModel.statusCode,
        ),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.toString(),
          statusCode: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
}
