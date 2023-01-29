// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:airly_monitor/config/api/dio_factory.dart' as _i6;
import 'package:airly_monitor/config/injector/module/common_module.dart'
    as _i21;
import 'package:airly_monitor/config/interceptors/auth_interceptor.dart' as _i4;
import 'package:airly_monitor/config/router/app_router.dart' as _i3;
import 'package:airly_monitor/cubits/auth/auth_cubit.dart' as _i20;
import 'package:airly_monitor/cubits/counter/counter_cubit.dart' as _i5;
import 'package:airly_monitor/data/repositories/auth/auth_repository.dart'
    as _i18;
import 'package:airly_monitor/data/repositories/auth/local_auth_repository.dart'
    as _i19;
import 'package:airly_monitor/data/storages/secure_storage.dart' as _i10;
import 'package:airly_monitor/data/storages/storage.dart' as _i12;
import 'package:airly_monitor/services/auth/auth_service.dart' as _i14;
import 'package:airly_monitor/services/auth/remote_auth_service.dart' as _i15;
import 'package:airly_monitor/services/geolocation/device_geolocation_service.dart'
    as _i17;
import 'package:airly_monitor/services/geolocation/geolocation_service.dart'
    as _i16;
import 'package:dio/dio.dart' as _i13;
import 'package:flutter_appauth/flutter_appauth.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:geolocator/geolocator.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final commonModule = _$CommonModule();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.factory<_i4.AuthInterceptor>(() => _i4.AuthInterceptor());
    gh.factory<_i5.CounterCubit>(() => _i5.CounterCubit());
    gh.singleton<_i6.DioFactory>(
      _i6.DioFactoryDev(),
      registerFor: {_dev},
    );
    gh.singleton<_i6.DioFactory>(
      _i6.DioFactoryProd(),
      registerFor: {_prod},
    );
    gh.factory<_i7.FlutterAppAuth>(() => commonModule.appAuth);
    gh.factory<_i8.FlutterSecureStorage>(
        () => commonModule.flutterSecureStorage);
    gh.factory<_i9.GeolocatorPlatform>(() => commonModule.geolocator);
    gh.factory<_i10.SecureStorage>(() => _i10.SecureStorage(
        flutterSecureStorage: gh<_i8.FlutterSecureStorage>()));
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => commonModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.Storage>(
        () => _i12.Storage(sharedPreferences: gh<_i11.SharedPreferences>()));
    gh.factory<_ApiService>(() => _ApiService(
          gh<_i13.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.lazySingleton<_i14.AuthService>(
        () => _i15.RemoteAuthService(gh<_i7.FlutterAppAuth>()));
    gh.lazySingleton<_i16.GeolocationService>(
        () => _i17.DeviceGeolocationService(gh<_i9.GeolocatorPlatform>()));
    gh.lazySingleton<_i18.AuthRepository>(() => _i19.LocalAuthRepository(
          gh<_i14.AuthService>(),
          gh<_i10.SecureStorage>(),
        ));
    gh.factory<_i20.AuthCubit>(() => _i20.AuthCubit(gh<_i18.AuthRepository>()));
    return this;
  }
}

class _$CommonModule extends _i21.CommonModule {}
