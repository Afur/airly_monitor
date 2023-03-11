part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loaded(Installation installation) = _Loaded;
  const factory DetailsState.loading() = _Loading;
  const factory DetailsState.observationChanged(bool isObserving) = _ObservationChanged;
  const factory DetailsState.error(AppError error) = _Error;
}

