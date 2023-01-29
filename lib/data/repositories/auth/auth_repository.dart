import 'package:airly_monitor/data/responses/response_status.dart';

abstract class AuthRepository {
  Future<ResponseStatus<bool>> checkIfAuthenticated();
  Future<ResponseStatus<void>> authenticate();
  Future<ResponseStatus<void>> logout();
}
