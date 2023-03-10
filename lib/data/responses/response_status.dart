import 'package:airly_monitor/data/errors/app_error.dart';

class ResponseStatus<T> {
  const ResponseStatus._({
    this.data,
    this.error,
  });

  factory ResponseStatus.error(AppError error) {
    return ResponseStatus._(
      error: error,
    );
  }

  factory ResponseStatus.success(T data) {
    return ResponseStatus._(
      data: data,
    );
  }

  final T? data;
  final AppError? error;

  void result({
    required Function(T) onSuccess,
    required Function(AppError) onError,
  }) {
    if (data != null) {
      onSuccess(data as T);
    } else if (error != null) {
      onError(error!);
    }
  }
}
