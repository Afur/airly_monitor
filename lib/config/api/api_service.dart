import 'package:airly_monitor/data/models/instalation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/api/Instalations')
  Future<List<Instalation>> receiveInstalations(
    @Query('Lat') String latitute,
    @Query('Lng') String longitude,
    @Query('MaxDistanceKM') String maxDistance,
    @Query('MaxResults') String maxResults,
  );
}
