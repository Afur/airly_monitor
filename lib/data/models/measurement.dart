import 'package:airly_monitor/data/models/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurement.freezed.dart';
part 'measurement.g.dart';

@freezed
class Measurement with _$Measurement {
  factory Measurement(
    String? id,
    @JsonKey(name: 'installationId') int installationId,
    @JsonKey(name: 'fromDateTime') String? fromDateTime,
    @JsonKey(name: 'tillDateTime') String? tillDateTime,
    @JsonKey(name: 'aqi') double? aqiIndex,
    String? values,
    @JsonKey(name: 'measurementValues') List<Value> measurementValues,
  ) = _Measurement;

  factory Measurement.fromJson(Map<String, dynamic> json) =>
      _$MeasurementFromJson(json);
}

extension MeasurementExtensions on Measurement? {
  int get currentAquIndex =>
      this?.aqiIndex?.toInt() ?? 0;

  int? get currentTemperature => this
      ?.measurementValues
      .firstWhere((element) => element.name == 'TEMPERATURE')
      .value
      .toInt();

  int? get currentPressure => this
      ?.measurementValues
      .firstWhere((element) => element.name == 'PRESSURE')
      .value
      .toInt(); 

  int? get currentHumidity => this
      ?.measurementValues
      .firstWhere((element) => element.name == 'HUMIDITY')
      .value
      .toInt();        
}
