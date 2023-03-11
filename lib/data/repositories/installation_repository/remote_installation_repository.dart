import 'package:airly_monitor/config/api/api_provider.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/installation_repository/installation_repository.dart';
import 'package:airly_monitor/data/requests/alert_request.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InstallationRepository)
@lazySingleton
class RemoteInstallationRepository extends InstallationRepository {
  RemoteInstallationRepository(this._apiProvider);

  final ApiProvider _apiProvider;

  @override
  Future<ResponseStatus<Installation>> loadInstallation(int id) async {
    try {
      final installation = await _apiProvider.call().receiveInstallation(id);

      return ResponseStatus.success(installation);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }

  @override
  Future<ResponseStatus<void>> createAlert({
    required int installationId,
    required int whenAqiReaches,
  }) async {
    try {
      await _apiProvider.call().createAlert([
        AlertRequest(installationId, whenAqiReaches),
      ]);

      return ResponseStatus.success(null);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }

  @override
  Future<ResponseStatus<void>> removeAlert({
    required int installationId,
  }) async {
    try {
      await _apiProvider.call().removeAlert(
            installationId,
          );

      return ResponseStatus.success(null);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }

  @override
  Future<ResponseStatus<void>> startObserving({
    required int installationId,
  }) async {
    try {
      await _apiProvider.call().startObservingInstallation(
            installationId,
          );

      return ResponseStatus.success(null);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }

  @override
  Future<ResponseStatus<void>> stopObserving({
    required int installationId,
  }) async {
    try {
      await _apiProvider.call().stopObservingInstallation(
            installationId,
          );

      return ResponseStatus.success(null);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }
}
