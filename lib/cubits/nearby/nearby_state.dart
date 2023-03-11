part of 'nearby_cubit.dart';

@freezed
class NearbyState with _$NearbyState {
  const factory NearbyState.initial() = _Initial;
  const factory NearbyState.loading() = _Loading;
  const factory NearbyState.data({
    required List<Installation> installations,
  }) = _Data;
  const factory NearbyState.error(AppError error) = _Error;
}
