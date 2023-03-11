
import 'package:airly_monitor/config/api/api_provider.dart';
import 'package:airly_monitor/config/constants/app_constants.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/nearby_installations/nearby_installations_repository.dart';
import 'package:airly_monitor/data/responses/response_status.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NearbyInstallationsRepository)
class RemoteNearbyInstallationsRepository extends NearbyInstallationsRepository {
  RemoteNearbyInstallationsRepository(this._apiProvider);

  final ApiProvider _apiProvider;

  @override
  Future<ResponseStatus<List<Installation>>> findNearbyInstallations() async {
    try {
      final installations = await _apiProvider
          .call()
          // For demo purposes we're loading installations from the same location
          // in real app we'd use current location
          .receiveInstallations(
            AppConstants.DEMO_LATTITUDE,
            AppConstants.DEMO_LONGITUDE,
            AppConstants.DEMO_KM_RANGE,
            AppConstants.DEMO_ITEMS,
          );

      return ResponseStatus.success(installations);
    } on Exception catch (exception) {
      return ResponseStatus.error(mapError(exception));
    }
  }
}

