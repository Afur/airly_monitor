import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/data/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  final AuthRepository _authRepository;

  Future<void> checkIfAuthenticated() async {
    final request = await _authRepository.checkIfAuthenticated();

    request.result(onSuccess: (isAuthenticated) async {
      if (isAuthenticated) {
        emit(
          const AuthState.authenticated(),
        );
      } else {
        await authenticate();
      }
    }, onError: (error) {
      emit(
        AuthState.error(error),
      );
    });
  }

  Future<void> authenticate() async {
    emit(
      const AuthState.authenticating(),
    );

    final request = await _authRepository.authenticate();

    request.result(onSuccess: (_) {
      emit(
        const AuthState.authenticated(),
      );
    }, onError: (error) {
      emit(
        AuthState.error(error),
      );
    });
  }
}
