import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_token_request.freezed.dart';
part 'device_token_request.g.dart';

@freezed
class DeviceTokenRequest with _$DeviceTokenRequest {
  factory DeviceTokenRequest(
    String token,
  ) = _DeviceTokenRequest;

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestFromJson(json);
}
