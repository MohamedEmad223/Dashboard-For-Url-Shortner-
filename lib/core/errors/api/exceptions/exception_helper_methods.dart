import 'package:dio/dio.dart';
import '../models/api_error_model.dart';
import 'api_exception.dart';

class ExceptionHelperMethods {
  ExceptionHelperMethods._();

  static void handle(dynamic error) {
    if (error is DioException) {
      _handleDioException(error);
    } else if (error is ApiException) {
      throw error;
    } else {
      throw ApiException(
        apiErrorModel: ApiErrorModel(
          message: 'An unexpected error occurred.',
          statusCode: 0,
        ),
      );
    }
  }

  static void _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        _throwNoInternet();
        break;

      case DioExceptionType.badResponse:
        _handleBadResponse(e);
        break;

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
      default:
        _throwConnectionError();
    }
  }

  static void _handleBadResponse(DioException e) {
    final response = e.response;
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;

    if (data is Map<String, dynamic>) {
      throw ApiException(
        apiErrorModel: ApiErrorModel.fromJson({
          ...data,
          'statusCode': statusCode,
        }),
      );
    }

    if (data is String) {
      throw ApiException(
        apiErrorModel: ApiErrorModel(
          message: data,
          statusCode: statusCode,
        ),
      );
    }

    throw ApiException(
      apiErrorModel: ApiErrorModel(
        message: _mapStatusCodeMessage(statusCode),
        statusCode: statusCode,
      ),
    );
  }

  static String _mapStatusCodeMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'Requested resource was not found.';
      case 409:
        return 'Data conflict occurred.';
      case 413:
        return 'Request entity is too large.';
      case 422:
        return 'Validation error occurred.';
      case 500:
      case 502:
      case 504:
        return 'Server error. Please try again later.';
      default:
        return 'An unexpected error occurred.';
    }
  }

  static void _throwNoInternet() {
    throw ApiException(
      apiErrorModel: ApiErrorModel(
        message: 'No internet connection. Please check your network.',
        statusCode: 0,
      ),
    );
  }

  static void _throwConnectionError() {
    throw ApiException(
      apiErrorModel: ApiErrorModel(
        message: 'Connection failed. Please try again later.',
        statusCode: 0,
      ),
    );
  }
}