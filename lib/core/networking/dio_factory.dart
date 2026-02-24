import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
      addDioInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  // static void addAuthInterceptor() {
  //   dio?.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) async {
  //         final token = await SharedPrefHelper.getString('token');
  //         if (token != null && token.isNotEmpty) {
  //           options.headers['Authorization'] = 'Bearer $token';
  //         } else {
  //           options.headers.remove('Authorization');
  //         }
  //         handler.next(options);
  //       },
  //     ),
  //   );
  // }

  // static void setTokenIntoHeaderAfterLogin(String token) {
  //   dio?.options.headers['Authorization'] = 'Bearer $token';
  // }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}