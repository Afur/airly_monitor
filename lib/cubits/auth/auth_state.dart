part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.authenticating() = Authenticating;

  const factory AuthState.authenticated() = Authenticated;

  const factory AuthState.error(AppError error) = Error;
}
