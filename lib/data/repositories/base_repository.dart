import 'dart:io';

import 'package:airly_monitor/data/errors/app_error.dart';
import 'package:airly_monitor/data/errors/network/network_error.dart';
import 'package:dio/dio.dart';

abstract class BaseRepository {
  AppError mapError(Exception error) {
    if (error is DioError) {
      if (error.error is SocketException) {
        return NetworkError.noInternetFailure();
      } else if (error.response?.statusCode == 500) {
        return NetworkError.serverFailure();
      }
    }

    return NetworkError.unknownFailure(error);
  }
}
