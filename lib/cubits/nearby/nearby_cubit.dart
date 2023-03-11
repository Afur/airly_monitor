import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/nearby_installations/nearby_installations_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_state.dart';
part 'nearby_cubit.freezed.dart';

class NearbyCubit extends Cubit<NearbyState> {
  NearbyCubit(this._nearbyInstalationsRepository)
      : super(const NearbyState.initial());

  final NearbyInstallationsRepository _nearbyInstalationsRepository;

  Future<void> findNearbyInstalations() async {
    emit(
      const NearbyState.loading(),
    );

    final request =
        await _nearbyInstalationsRepository.findNearbyInstallations();

    request.result(onSuccess: (instalations) {
      emit(
        NearbyState.data(installations: instalations),
      );
    }, onError: (error) {
      emit(
        NearbyState.error(error),
      );
    });
  }
}
