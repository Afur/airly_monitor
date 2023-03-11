import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/base_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';

abstract class UserInstallationsRepository extends BaseRepository {
  Future<ResponseStatus<List<Installation>>> loadUserInstallations();
}
