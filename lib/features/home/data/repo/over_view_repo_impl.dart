import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/home/data/data_source/over_view_data_source.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/home/domain/repo/over_view_repo.dart';
import 'package:dio/dio.dart';

class OverViewRepoimpl implements OverViewRepo{

  final OverViewDataSource _overViewDataSource;
  OverViewRepoimpl(this._overViewDataSource);
  @override
  Future<ApiResult<OverViewResponseModel>> overView() async{
    try {
      final response =await _overViewDataSource.overView();
      return ApiResult.success(response);
    } on ApiException catch (error) {
      return ApiResult.failure(
        ApiErrorModel(
          message: error.apiErrorModel.message,
          statusCode: error.apiErrorModel.statusCode,
        ),
      );

    } on DioException catch (error){
      return ApiResult.failure(
        ApiErrorModel(
          message: error.message!,
          statusCode: error.response?.statusCode ?? 0,
        ),
      );
    }  catch (error) {
      return ApiResult.failure(
        ApiErrorModel(message: error.toString(), statusCode: 0),
      );
    }
  }
}