import 'package:airly_monitor/data/models/address.dart';
import 'package:airly_monitor/data/models/measurement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'installation.freezed.dart';
part 'installation.g.dart';

@freezed
class Installation with _$Installation {
  factory Installation(
    int id,
    Address address,
    double? elevation,
    @JsonKey(name: 'distanceToInstallationMeters')
    double? distanceToInstallationMeters,
    bool marked,
    @JsonKey(name: 'hasAlert')
    bool hasAlert,
    Measurement? measurement,
  ) = _Installation;

  factory Installation.fromJson(Map<String, dynamic> json) =>
      _$InstallationFromJson(json);
}
