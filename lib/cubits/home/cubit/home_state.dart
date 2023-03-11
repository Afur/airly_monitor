part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  
  const factory HomeState.permissionGranted() = _PermissionGranted;

  const factory HomeState.permissionNotGranted() = _PermissionNotGranted;

  const factory HomeState.error(AppError error) = _Error;
}
