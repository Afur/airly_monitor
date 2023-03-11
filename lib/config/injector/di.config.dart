// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_appauth/flutter_appauth.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:geolocator/geolocator.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../cubits/auth/auth_cubit.dart' as _i30;
import '../../cubits/details/cubit/details_cubit.dart' as _i27;
import '../../cubits/home/cubit/home_cubit.dart' as _i18;
import '../../cubits/nearby/nearby_cubit.dart' as _i28;
import '../../cubits/observed/cubit/observed_cubit.dart' as _i29;
import '../../data/repositories/auth/auth_repository.dart' as _i25;
import '../../data/repositories/auth/local_auth_repository.dart' as _i26;
import '../../data/repositories/installation_repository/installation_repository.dart'
    as _i19;
import '../../data/repositories/installation_repository/remote_installation_repository.dart'
    as _i20;
import '../../data/repositories/nearby_installations/nearby_installations_repository.dart'
    as _i21;
import '../../data/repositories/nearby_installations/remote_nearby_installations_repository.dart'
    as _i22;
import '../../data/repositories/user_installations/remote_user_installations_repository.dart'
    as _i24;
import '../../data/repositories/user_installations/user_installations_repository.dart'
    as _i23;
import '../../data/storages/secure_storage.dart' as _i10;
import '../../data/storages/storage.dart' as _i12;
import '../../services/auth/auth_service.dart' as _i14;
import '../../services/auth/remote_auth_service.dart' as _i15;
import '../../services/geolocation/device_geolocation_service.dart' as _i17;
import '../../services/geolocation/geolocation_service.dart' as _i16;
import '../api/api_provider.dart' as _i13;
import '../api/dio_factory.dart' as _i6;
import '../interceptors/auth_interceptor.dart' as _i4;
import '../router/app_router.dart' as _i3;
import 'module/common_module.dart' as _i32;
import 'module/network_module.dart' as _i31;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final commonModule = _$CommonModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.factory<_i4.AuthInterceptor>(() => _i4.AuthInterceptor());
  gh.factory<_i5.Dio>(() => networkModule.provideDio);
  gh.singleton<_i6.DioFactory>(
    _i6.DioFactoryDev(),
    registerFor: {_dev},
  );
  gh.singleton<_i6.DioFactory>(
    _i6.DioFactoryProd(),
    registerFor: {_prod},
  );
  gh.factory<_i7.FlutterAppAuth>(() => commonModule.appAuth);
  gh.factory<_i8.FlutterSecureStorage>(() => commonModule.flutterSecureStorage);
  gh.factory<_i9.GeolocatorPlatform>(() => commonModule.geolocator);
  gh.factory<_i10.SecureStorage>(() => _i10.SecureStorage(
      flutterSecureStorage: get<_i8.FlutterSecureStorage>()));
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => commonModule.prefs,
    preResolve: true,
  );
  gh.factory<_i12.Storage>(
      () => _i12.Storage(sharedPreferences: get<_i11.SharedPreferences>()));
  
  gh.lazySingleton<_i13.ApiProvider>(
      () => _i13.ApiProvider(get<_i6.DioFactory>()));
  gh.lazySingleton<_i14.AuthService>(
      () => _i15.RemoteAuthService(get<_i7.FlutterAppAuth>()));
  gh.lazySingleton<_i16.GeolocationService>(
      () => _i17.DeviceGeolocationService(get<_i9.GeolocatorPlatform>()));
  gh.factory<_i18.HomeCubit>(
      () => _i18.HomeCubit(get<_i16.GeolocationService>()));
  gh.factory<_i19.InstallationRepository>(
      () => _i20.RemoteInstallationRepository(get<_i13.ApiProvider>()));
  gh.factory<_i21.NearbyInstallationsRepository>(
      () => _i22.RemoteNearbyInstallationsRepository(get<_i13.ApiProvider>()));
  gh.factory<_i23.UserInstallationsRepository>(
      () => _i24.RemoteUsersInstallationsRepository(get<_i13.ApiProvider>()));
  gh.lazySingleton<_i25.AuthRepository>(() => _i26.LocalAuthRepository(
        get<_i14.AuthService>(),
        get<_i10.SecureStorage>(),
      ));
  gh.factory<_i27.DetailsCubit>(
      () => _i27.DetailsCubit(get<_i19.InstallationRepository>()));
  gh.factory<_i28.NearbyCubit>(
      () => _i28.NearbyCubit(get<_i21.NearbyInstallationsRepository>()));
  gh.factory<_i29.ObservedCubit>(
      () => _i29.ObservedCubit(get<_i23.UserInstallationsRepository>()));
  gh.factory<_i30.AuthCubit>(() => _i30.AuthCubit(get<_i25.AuthRepository>()));
  return get;
}

class _$NetworkModule extends _i31.NetworkModule {}

class _$CommonModule extends _i32.CommonModule {}
