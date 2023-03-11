import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  static const accept = 'accept';
  static const authorizationKey = 'Authorization';

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(
      options
        ..headers.addAll(
          {
            accept: 'text/json',
            authorizationKey:
                'Bearer ${const String.fromEnvironment('DEMO_TOKEN')}'
          },
        ),
    );
  }
}
