import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/repositories/user_installations/user_installations_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'observed_state.dart';
part 'observed_cubit.freezed.dart';

class ObservedCubit extends Cubit<ObservedState> {
  ObservedCubit(this._userInstallationsRepository)
      : super(const ObservedState.initial());

  final UserInstallationsRepository _userInstallationsRepository;

  Future<void> findObservedInstallations() async {
    emit(
      const ObservedState.loading(),
    );

    final request =
        await _userInstallationsRepository.loadUserInstallations();

    request.result(onSuccess: (instalations) {
      emit(
        ObservedState.data(installations: instalations),
      );
    }, onError: (error) {
      emit(
        ObservedState.error(error),
      );
    });
  }
}
