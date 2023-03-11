import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_request.freezed.dart';
part 'alert_request.g.dart';

@freezed
class AlertRequest with _$AlertRequest {
  factory AlertRequest(
    @JsonKey(name: 'installationId')
    int installationId,
    @JsonKey(name: 'aqiThreshold')
    int aqiThreshold,
  ) = _AlertRequest;

  factory AlertRequest.fromJson(Map<String, dynamic> json) =>
      _$AlertRequestFromJson(json);
}
