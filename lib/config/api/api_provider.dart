import 'package:airly_monitor/config/api/dio_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:airly_monitor/config/api/api_service.dart';

@lazySingleton
class ApiProvider {
  final DioFactory _dioFactory;

  ApiProvider(this._dioFactory);

  ApiService call() => ApiService(
        _dioFactory.dioInstance,
      );
}
