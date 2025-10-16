import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_apns_live_activity_tokens.freezed.dart';
part 'device_apns_live_activity_tokens.g.dart';

/// APNSライブアクティビティトークンの種類
enum ApnsLiveActivityTokenType {
  @JsonValue('start')
  start,
  @JsonValue('update')
  update,
}

/// APNSライブアクティビティトークン
@freezed
abstract class DeviceApnsLiveActivityTokens
    with _$DeviceApnsLiveActivityTokens {
  const factory DeviceApnsLiveActivityTokens({
    required String deviceId,
    required String token,
    required ApnsLiveActivityTokenType type,
    required String topic,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _DeviceApnsLiveActivityTokens;

  factory DeviceApnsLiveActivityTokens.fromJson(Map<String, dynamic> json) =>
      _$DeviceApnsLiveActivityTokensFromJson(json);
}
