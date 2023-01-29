import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

abstract class AuthService {
  Future<ResponseStatus<AuthorizationTokenResponse>> authenticate();
}
