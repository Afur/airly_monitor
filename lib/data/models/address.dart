import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address(
    @JsonKey(name: 'addressId')
    String? addressId,
    String? country,
    String? city,
    String? street,
    String? number,
    @JsonKey(name: 'displayAddress1')
    String? displayAddress1,
    @JsonKey(name: 'displayAddress2')
    String? displayAddress2,
  ) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
