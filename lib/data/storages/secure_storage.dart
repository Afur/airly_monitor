import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String ACCESS_TOKEN_KEY = "access_token";
const String REFRESH_TOKEN_KEY = "refresh_token";

class SecureStorage {
  const SecureStorage({
    required this.flutterSecureStorage,
  });

  final FlutterSecureStorage flutterSecureStorage;

  Future<void> putString({
    required String key,
    required String value,
  }) =>
      flutterSecureStorage.write(
        key: key,
        value: value,
      );

  Future<bool> contains({
    required String key,
  }) =>
      flutterSecureStorage.containsKey(
        key: key,
      );

  Future<String?> getString({
    required String key,
  }) =>
      flutterSecureStorage.read(
        key: key,
      );

  Future<void> remove({
    required String key,
  }) =>
      flutterSecureStorage.delete(
        key: key,
      );

  Future<void> removeAll() => flutterSecureStorage.deleteAll();
}
