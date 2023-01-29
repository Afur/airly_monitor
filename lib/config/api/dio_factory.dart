import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DioFactory {
  Dio get(String url);
}

@Singleton(as: DioFactory, env: [Env.dev])
class DioFactoryDev extends DioFactory {
  @override
  Dio get(String url) => _baseDio(url)
    ..interceptors.addAll(
      [
        LogInterceptor(requestBody: true, responseBody: true),
      ],
    );
}

@Singleton(as: DioFactory, env: [Env.prod])
class DioFactoryProd extends DioFactory {
  @override
  Dio get(String url) => _baseDio(url);
}

Dio _baseDio(String url) => Dio(
      _options(url),
    )..interceptors.add(AuthInterceptor());

BaseOptions _options(String baseUrl) => BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
