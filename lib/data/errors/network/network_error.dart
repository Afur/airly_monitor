import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_error.freezed.dart';

@freezed
class NetworkError extends AppError with _$NetworkError implements Exception {
  NetworkError._();

  factory NetworkError.noInternetFailure() = _NoInternetError;
  factory NetworkError.serverFailure({
    required int? statusCode,
    required Map<String, dynamic>? json,
  }) = _ServerError;
  factory NetworkError.unknownFailure(dynamic error) = _UnknownError;

  @override
  String toString() {
    return 'Use localizedTitle or localizedContent methods instead of toString()';
  }

  @override
  String get message => when(
        noInternetFailure: () => '',
        serverFailure: (statusCode, json) => '',
        unknownFailure: (_) => '',
      );
}
