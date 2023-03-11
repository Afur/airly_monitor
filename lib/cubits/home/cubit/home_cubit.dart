import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/services/geolocation/geolocation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._geolocationService) : super(const HomeState.loading());

  final GeolocationService _geolocationService;

  Future<void> checkLocationPermissions() async{
    final request = await _geolocationService.checkPermissions();

    request.result(onSuccess: (isGranted) {
      if (isGranted) {
        emit(const HomeState.permissionGranted());
      } else {
        emit(const HomeState.permissionNotGranted());
      }
    }, onError: (error) {
      emit(const HomeState.permissionNotGranted());
    });
  }
}
