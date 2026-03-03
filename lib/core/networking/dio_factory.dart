import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.validateStatus = (status) {
          // Only accept 2xx status codes as successful
          return status != null && status >= 200 && status < 300;
        }
        ..options.headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };

      _addAuthInterceptor();
      _addResponseInterceptor();
      _addDioLogger();

    }

    return dio!;
  }

  static void _addAuthInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheHelper.getSecureData(
            key: ApiConstants.accessToken,
          );

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
          }

          return handler.next(options);
        },
      ),
    );
  }

  static void _addResponseInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          // Check if response body contains an error status (like 422, 404, 500, etc.)
          if (response.data is Map<String, dynamic>) {
            final data = response.data as Map<String, dynamic>;
            final bodyStatus = data['status'];

            // If status in body is not 200-299 and not "success", treat as error
            if (bodyStatus is int && (bodyStatus < 200 || bodyStatus >= 300)) {
              // Convert successful HTTP response to DioException
              handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  response: response,
                  type: DioExceptionType.badResponse,
                  error: 'Server returned error status: $bodyStatus',
                ),
              );
              return;
            }
          }

          handler.next(response);
        },
      ),
    );
  }

  static void _addDioLogger() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}