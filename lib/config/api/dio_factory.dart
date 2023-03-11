import 'package:airly_monitor/config/constants/app_constants.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DioFactory {
  Dio get dioInstance;
}

@Singleton(as: DioFactory, env: [Env.dev])
class DioFactoryDev extends DioFactory {
  @override
  Dio get dioInstance => _baseDio(AppConstants.SERVER_URL)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ],
    );
}

@Singleton(as: DioFactory, env: [Env.prod])
class DioFactoryProd extends DioFactory {
  @override
  Dio get dioInstance => _baseDio(AppConstants.SERVER_URL);
}

Dio _baseDio(String url) => Dio(
      _options(url),
    )..interceptors.addAll([
        AuthInterceptor(),
      ]);

BaseOptions _options(String baseUrl) => BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
