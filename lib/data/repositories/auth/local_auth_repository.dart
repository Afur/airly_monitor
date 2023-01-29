import 'package:airly_monitor/data/errors/auth/auth_error.dart';
import 'package:airly_monitor/data/repositories/auth/auth_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:airly_monitor/data/storages/secure_storage.dart';
import 'package:airly_monitor/services/auth/auth_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class LocalAuthRepository implements AuthRepository {
  LocalAuthRepository(
    this._authService,
    this._secureStorage,
  );

  final AuthService _authService;
  final SecureStorage _secureStorage;

  @override
  Future<ResponseStatus<bool>> checkIfAuthenticated() async {
    try {
      final isAuthenticated =
          (await _secureStorage.contains(key: ACCESS_TOKEN_KEY) &&
              await _secureStorage.contains(key: REFRESH_TOKEN_KEY));

      return ResponseStatus.success(isAuthenticated);         
    } catch (e) {
      return ResponseStatus.error(
        AuthError.unknownFailure(e),
      );
    }
  }

  @override
  Future<ResponseStatus<void>> authenticate() async {
    try {
      final result = await _authService.authenticate();
      final authData = result.data;

      if (authData != null &&
          authData.accessToken != null &&
          authData.refreshToken != null) {
        await _secureStorage.putString(
          key: ACCESS_TOKEN_KEY,
          value: authData.accessToken!,
        );

        await _secureStorage.putString(
          key: REFRESH_TOKEN_KEY,
          value: authData.refreshToken!,
        );

        return ResponseStatus.success(null);
      } else {
        return ResponseStatus.error(
          AuthError.authenticationFailure(),
        );
      }
    } catch (e) {
      return ResponseStatus.error(
        AuthError.unknownFailure(e),
      );
    }
  }

  @override
  Future<ResponseStatus<void>> logout() async {
    try {
      await _secureStorage.removeAll();
      return ResponseStatus.success(null);
    } catch (e) {
      return ResponseStatus.error(
        AuthError.unknownFailure(e),
      );
    }
  }
}
