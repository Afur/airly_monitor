import 'package:freezed_annotation/freezed_annotation.dart';

part 'value.freezed.dart';
part 'value.g.dart';

@freezed
class Value with _$Value {
  factory Value(
    String name,
    double value,
  ) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) =>
      _$ValueFromJson(json);
}
