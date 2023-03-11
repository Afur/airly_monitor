import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/base_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';

abstract class InstallationRepository extends BaseRepository {
  Future<ResponseStatus<Installation>> loadInstallation(int id);
  
  Future<ResponseStatus<void>> createAlert({
    required int installationId,
    required int whenAqiReaches,
  });

  Future<ResponseStatus<void>> removeAlert({
    required int installationId,
  });

  Future<ResponseStatus<void>> startObserving({
    required int installationId,
  });

  Future<ResponseStatus<void>> stopObserving({
    required int installationId,
  });
}
