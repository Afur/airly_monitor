import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_error.freezed.dart';

@freezed
class AuthError extends AppError with _$AuthError implements Exception {
  AuthError._();

  factory AuthError.authenticationFailure() = _AuthenticationError;
  factory AuthError.unknownFailure(dynamic error) = _UnknownError;

  @override
  String toString() => message;

  @override
  String get message => when(
        authenticationFailure: () => '',
        unknownFailure: (_) => '',
      );
}
