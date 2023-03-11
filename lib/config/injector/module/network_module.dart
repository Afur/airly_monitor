
import 'package:airly_monitor/config/constants/app_constants.dart';
import 'package:airly_monitor/config/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  Dio get provideDio {
    final dio = Dio(_options(AppConstants.SERVER_URL));
    dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);

    return dio;
  }

  BaseOptions _options(String baseUrl) => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
}
