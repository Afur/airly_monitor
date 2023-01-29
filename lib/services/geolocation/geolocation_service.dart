import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationService {
  Future<ResponseStatus<bool>> checkPermissions();
  Future<ResponseStatus<Position>> determinatePosition();
}
