import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:airly_monitor/config/injector/di.config.dart';

@InjectableInit()
class DI {
  DI._();

  final GetIt _getIt = GetIt.I;

  static final DI instance = DI._();

  Future<void> setupInjection(String environment) async => _getIt.init(
        environment: environment,
      );

  // Use this to get registered instance
  static T resolve<T extends Object>() => instance._getIt.get();
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
