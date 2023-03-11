import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/base_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';

abstract class NearbyInstallationsRepository extends BaseRepository {
  Future<ResponseStatus<List<Installation>>> findNearbyInstallations();
}
