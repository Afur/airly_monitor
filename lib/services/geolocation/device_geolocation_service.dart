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

    // Test if location services are enabled.
    serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return Future.value();
  }

  @override
  Future<ResponseStatus<Position>> determinatePosition() {
    throw UnimplementedError();
  }
}
