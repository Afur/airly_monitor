import 'package:airly_monitor/data/errors/geolocator/geolocator_error.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:airly_monitor/services/geolocation/geolocation_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GeolocationService)
class DeviceGeolocationService extends GeolocationService {
  DeviceGeolocationService(this._geolocator);

  final GeolocatorPlatform _geolocator;

  @override
  Future<ResponseStatus<bool>> checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return ResponseStatus.error(
        GeolocatorError.permissionDenied(),
      );
    }

    permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return ResponseStatus.error(GeolocatorError.permissionDenied());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return ResponseStatus.error(GeolocatorError.permissionDeniedForever());
    }

    return ResponseStatus.success(serviceEnabled);
  }

  @override
  Future<ResponseStatus<Position>> determinatePosition() async {
    try {
      final position = await _geolocator.getCurrentPosition();
      return ResponseStatus.success(position);
    } on Exception catch (e) {
      return ResponseStatus.error(
        GeolocatorError.unknownFailure(e),
      );
    }
  }
}
