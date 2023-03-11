import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_error.freezed.dart';

@freezed
class NetworkError extends AppError with _$NetworkError implements Exception {
  NetworkError._();

  factory NetworkError.noInternetFailure() = _NoInternetError;
  factory NetworkError.serverFailure() = _ServerError;
  factory NetworkError.unknownFailure(dynamic error) = _UnknownError;

  @override
  String toString() => message;

  @override
  String get message => when(
        noInternetFailure: () => '',
        serverFailure: () => '',
        unknownFailure: (_) => '',
      );
}
