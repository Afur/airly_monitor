import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/installation_repository/installation_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._installationRepository) : super(DetailsState.initial());

  final InstallationRepository _installationRepository;

  Future<void> load(int installationId) async {
    emit(DetailsState.loading());

    await _installationRepository.loadInstallation(installationId).then(
          (response) => response.result(
            onSuccess: (installation) => emit(
              DetailsState.loaded(installation),
            ),
            onError: (error) => emit(
              DetailsState.error(error),
            ),
          ),
        );
  }

  Future<void> startObserving(int installationId) async {
    emit(DetailsState.loading());

    await _installationRepository
        .startObserving(
          installationId: installationId,
        )
        .then(
          (response) => response.result(
            onSuccess: (installation) async => await load(installationId),
            onError: (error) => emit(
              DetailsState.error(error),
            ),
          ),
        );
  }

  Future<void> stopObserving(int installationId) async {
    emit(DetailsState.loading());

    await _installationRepository
        .stopObserving(
          installationId: installationId,
        )
        .then(
          (response) => response.result(
            onSuccess: (installation) async => await load(installationId),
            onError: (error) => emit(
              DetailsState.error(error),
            ),
          ),
        );
  }

  Future<void> createAlert({
    required int installationId,
    required int whenAqiReaches,
  }) async {
    emit(DetailsState.loading());

    await _installationRepository
        .createAlert(
          installationId: installationId,
          whenAqiReaches: whenAqiReaches,
        )
        .then(
          (response) => response.result(
            onSuccess: (installation) async => await load(installationId),
            onError: (error) => emit(
              DetailsState.error(error),
            ),
          ),
        );
  }

  Future<void> removeAlert(int installationId) async {
    emit(DetailsState.loading());

    await _installationRepository
        .removeAlert(
          installationId: installationId,
        )
        .then(
          (response) => response.result(
            onSuccess: (installation) async => await load(installationId),
            onError: (error) => emit(
              DetailsState.error(error),
            ),
          ),
        );
  }
}
