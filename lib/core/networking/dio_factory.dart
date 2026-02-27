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
        ..options.headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };

      _addAuthInterceptor();
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