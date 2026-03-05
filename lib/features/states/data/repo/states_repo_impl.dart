import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_over_time_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/recent_clicks_response.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/repo/states_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api/exceptions/api_exception.dart';
import '../../../../core/errors/api/models/api_error_model.dart';
import '../states_data_source/states_data_source.dart';

class StatesRepoImpl implements StatesRepo {
  final StatesDataSource _statesDataSource;
  const StatesRepoImpl(this._statesDataSource);

  String _friendlyMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data['message'] is String) {
      return data['message'] as String;
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode ?? 0;
        if (code == 404) return 'Resource not found (404).';
        if (code == 401) return 'Unauthorised. Please log in again.';
        if (code >= 500) return 'Server error. Please try again later.';
        return 'Server error ($code).';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  @override
  Future<ApiResult<ClicksOverTimeResponse>> getClicksOverTime({
    required String from,
    required String to,
  }) async {
    try {
      final response = await _statesDataSource.getClicksOverTime(from: from, to: to);
      return ApiResult.success(response);
    } on ApiException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: error.apiErrorModel.message,
        statusCode: error.apiErrorModel.statusCode,
      ));
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: _friendlyMessage(error),
        statusCode: error.response?.statusCode ?? 0,
      ));
    } catch (error) {
      return ApiResult.failure(
          ApiErrorModel(message: 'Something went wrong. Please try again.', statusCode: 0));
    }
  }

  @override
  Future<ApiResult<RecentClicksResponse>> getRecentClicks({int? limit}) async {
    try {
      final response = await _statesDataSource.getRecentClicks(limit: limit);
      return ApiResult.success(response);
    } on ApiException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: error.apiErrorModel.message,
        statusCode: error.apiErrorModel.statusCode,
      ));
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: _friendlyMessage(error),
        statusCode: error.response?.statusCode ?? 0,
      ));
    } catch (error) {
      return ApiResult.failure(
          ApiErrorModel(message: 'Something went wrong. Please try again.', statusCode: 0));
    }
  }

  @override
  Future<ApiResult<LinkAnalyticsResponse>> getLinkAnalytics(int linkId) async {
    try {
      final response =
          await _statesDataSource.getLinkAnalytics(EndPoints.linkAnalytics(linkId));
      return ApiResult.success(response);
    } on ApiException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: error.apiErrorModel.message,
        statusCode: error.apiErrorModel.statusCode,
      ));
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorModel(
        message: _friendlyMessage(error),
        statusCode: error.response?.statusCode ?? 0,
      ));
    } catch (error) {
      return ApiResult.failure(
          ApiErrorModel(message: 'Something went wrong. Please try again.', statusCode: 0));
    }
  }
}
