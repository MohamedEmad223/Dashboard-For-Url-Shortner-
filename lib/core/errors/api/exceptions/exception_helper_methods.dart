import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dio/dio.dart';
import 'api_exception.dart';

class ExceptionHelperMethods {
  ExceptionHelperMethods._();

  static void handleDioExceptionsTypes(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throwApiException(noInternetErrorMessage);
        break;

      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        throwApiException(connectionErrorMessage);
        break;

      case DioExceptionType.badResponse:
        badResponseErrorHandle(e);
        break;

      default:
        throwApiException(connectionErrorMessage);
    }
  }

  static void badResponseErrorHandle(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 404:
      case 409:
      case 422:
      case 502:
      case 504:
      case 302:
        badResponseExceptionThrow(e);
        break;

      case 413:
        throw ApiException(
          apiErrorModel: ApiErrorModel(
            message: "Request entity too large",
            statusCode: statusCode,
          ),
        );

      default:
        badResponseExceptionThrow(e);
    }
  }

  static void badResponseExceptionThrow(DioException e) {
    if (e.response != null && e.response!.data != null) {
      final statusCode = e.response?.statusCode ?? 0;

      if (e.response!.data is String) {
        throw ApiException(
          apiErrorModel: ApiErrorModel(
            message: e.response!.data.toString(),
            statusCode: statusCode,
          ),
        );
      } else if (e.response!.data is Map<String, dynamic>) {
        throw ApiException(
          apiErrorModel: ApiErrorModel.fromJson(e.response!.data),
        );
      } else {
        throwApiException(connectionErrorMessage);
      }
    } else {
      throwApiException(connectionErrorMessage);
    }
  }

  static void throwApiException(Map<String, dynamic> error) {
    throw ApiException(apiErrorModel: ApiErrorModel.fromJson(error));
  }

  static Map<String, dynamic> get connectionErrorMessage => {
    'message': 'Try again later',
    'statusCode': 0,
  };

  static Map<String, dynamic> get noInternetErrorMessage => {
    'message':
        'No Internet Connection, Please check your connection and try again',
    'statusCode': 0,
  };
}
