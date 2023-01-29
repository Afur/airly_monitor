import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class CommonModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @injectable
  GeolocatorPlatform get geolocator => GeolocatorPlatform.instance;

  @injectable
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @injectable
  FlutterAppAuth get appAuth => const FlutterAppAuth();
}
