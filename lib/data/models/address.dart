import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address(
    String? addressId,
    String? country,
    String? city,
    String? street,
    String? number,
    String? displayAddress1,
    String? displayAddress2,
  ) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
