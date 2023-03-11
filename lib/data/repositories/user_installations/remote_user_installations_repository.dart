import 'package:airly_monitor/config/api/api_provider.dart';
import 'package:airly_monitor/config/constants/app_constants.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/user_installations/user_installations_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserInstallationsRepository)
@lazySingleton
class RemoteUsersInstallationsRepository extends UserInstallationsRepository {
  RemoteUsersInstallationsRepository(this._apiProvider);

  final ApiProvider _apiProvider;

  @override
  Future<ResponseStatus<List<Installation>>> loadUserInstallations() async {
    try {
      final installations =
          await _apiProvider.call().receiveUserInstallations();

      return ResponseStatus.success(installations);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }
}
