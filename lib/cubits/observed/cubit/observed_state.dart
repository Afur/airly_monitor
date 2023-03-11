part of 'observed_cubit.dart';

@freezed
class ObservedState with _$ObservedState {
  const factory ObservedState.initial() = _Initial;
  const factory ObservedState.loading() = _Loading;
  const factory ObservedState.data({
    required List<Installation> installations,
  }) = _Data;
  const factory ObservedState.error(AppError error) = _Error;
}
