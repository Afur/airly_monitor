import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/requests/alert_request.dart';
import 'package:airly_monitor/data/requests/device_token_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('/api/Installations/register-device')
  Future<void> registerDevice(
    @Body() DeviceTokenRequest deviceTokenRequest,
  );

  @GET('/api/Installations')
  Future<List<Installation>> receiveInstallations(
    @Query('Lat') String latitute,
    @Query('Lng') String longitude,
    @Query('MaxDistanceKM') String maxDistance,
    @Query('MaxResults') String maxResults,
  );

  @POST('/api/Installations/{installationId}')
  Future<Installation> receiveInstallation(
    @Path('installationId') int installationId,
  );

  @GET('/api/Installations')
  Future<List<Installation>> receiveUserInstallations();

  @POST('/api/Installations/mark/{installationId}')
  Future<void> startObservingInstallation(
    @Path('installationId') int installationId,
  );

  @DELETE('/api/Installations/umark/{installationId}')
  Future<void> stopObservingInstallation(
    @Path('installationId') int installationId,
  );

  @POST('/api/AlertDefinitions')
  Future<void> createAlert(
    @Body() List<AlertRequest> alertRequest,
  );

  @DELETE('/api/AlertDefinitions/{installationId}')
  Future<void> removeAlert(
    @Path('installationId') int installationId,
  );
}
