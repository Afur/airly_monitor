import 'package:airly_monitor/data/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instalation.freezed.dart';
part 'instalation.g.dart';

@freezed
class Instalation with _$Instalation {
  factory Instalation(
    int id,
    Address address,
    int elevation,
    int distanceToInstallationMeters,
  ) = _Instalation;

  factory Instalation.fromJson(Map<String, dynamic> json) =>
      _$InstalationFromJson(json);
}
