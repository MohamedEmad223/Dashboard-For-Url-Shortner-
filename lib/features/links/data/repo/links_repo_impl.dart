import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/api_exception.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/exceptions/exception_helper_methods.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/data_source/links_data_source.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_request.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_response.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/get_all_links_response.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/toggle_link_response.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/repo/create_links_repo/links_repo.dart';
import 'package:dio/dio.dart';
class LinksRepoImpl implements linksRepo {
  final LinksDataSource _dataSource;
  LinksRepoImpl(this._dataSource);
  @override
  Future<ApiResult<CreateLinkResponse>> createLink(CreateLinkRequest request) async {
    try {
      final response = await _dataSource.createLink(request);
      return ApiResult.success(response);
    } on ApiException catch (e) {
      return ApiResult.failure(e.apiErrorModel);
    } on DioException catch (e) {
      ExceptionHelperMethods.handleDioExceptionsTypes(e);
      return ApiResult.failure(
        ApiErrorModel(message: 'Unexpected Error', statusCode: 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
  @override
  Future<ApiResult<GetLinksResponse>> getAllLinks() async {
    try {
      final response = await _dataSource.getAllLinks();
      return ApiResult.success(response);
    } on ApiException catch (e) {
      return ApiResult.failure(e.apiErrorModel);
    } on DioException catch (e) {
      ExceptionHelperMethods.handleDioExceptionsTypes(e);
      return ApiResult.failure(
        ApiErrorModel(message: 'Unexpected Error', statusCode: 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
  @override
  Future<ApiResult<MessageResponse>> deleteLink(String id) async {
    try {
      await _dataSource.deleteLink(id.toString());
      return ApiResult.success(MessageResponse(
        message: 'Link deleted successfully',
        status: 'success',
      ));
    } on ApiException catch (e) {
      return ApiResult.failure(e.apiErrorModel);
    } on DioException catch (e) {
      ExceptionHelperMethods.handleDioExceptionsTypes(e);
      return ApiResult.failure(
        ApiErrorModel(message: 'Unexpected Error', statusCode: 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
  @override
  Future<ApiResult<ToggleLinkResponse>> toggleLink(String id) async {
    try {
      final response = await _dataSource.toggleLink(id.toString());
      return ApiResult.success(response);
    } on ApiException catch (e) {
      return ApiResult.failure(e.apiErrorModel);
    } on DioException catch (e) {
      ExceptionHelperMethods.handleDioExceptionsTypes(e);
      return ApiResult.failure(
        ApiErrorModel(message: 'Unexpected Error', statusCode: 0),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: e.toString(), statusCode: 0),
      );
    }
  }
}
