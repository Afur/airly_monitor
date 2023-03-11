import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocator_error.freezed.dart';

@freezed
class GeolocatorError extends AppError
    with _$GeolocatorError
    implements Exception {
  GeolocatorError._();

  factory GeolocatorError.notAvailable() = _NotAvailableError;
  factory GeolocatorError.permissionDenied() = _PermissionDeniedError;
  factory GeolocatorError.permissionDeniedForever() = _PermissionDeniedForeverError;
  factory GeolocatorError.unknownFailure(dynamic error) = _UnknownError;

  @override
  String toString() {
    return message;
  }

  @override
  String get message => when(
        notAvailable: () => '',
        permissionDenied: () => '',
        permissionDeniedForever: () => '',
        unknownFailure: (_) => '',
      );
}
