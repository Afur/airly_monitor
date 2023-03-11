import 'package:airly_monitor/config/constants/app_constants.dart';
import 'package:airly_monitor/data/errors/auth/auth_error.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:airly_monitor/services/auth/auth_service.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class RemoteAuthService extends AuthService {
  RemoteAuthService(this._appAuth);

  final FlutterAppAuth _appAuth;

  @override
  Future<ResponseStatus<AuthorizationTokenResponse>> authenticate() async {
    try {
      final result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AppConstants.AUTH_CLIENT_ID,
          AppConstants.AUTH_REDIRECT_URL,
          discoveryUrl: AppConstants.AUTH_DISCOUVERY_DOCUMENTS,
          scopes: AppConstants.AUTH_SCOPE,
          allowInsecureConnections: true
        ),
      );

      return result != null
          ? ResponseStatus.success(result)
          : ResponseStatus.error(
              AuthError.authenticationFailure(),
            );
    } on Exception catch (e) {
      return ResponseStatus.error(
        AuthError.unknownFailure(e),
      );
    }
  }
}
