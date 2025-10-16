import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_apns_tokens.freezed.dart';
part 'device_apns_tokens.g.dart';

/// APNSトークン
@freezed
abstract class DeviceApnsTokens with _$DeviceApnsTokens {
  const factory DeviceApnsTokens({
    required String id,
    required String deviceId,
    required String token,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _DeviceApnsTokens;

  factory DeviceApnsTokens.fromJson(Map<String, dynamic> json) =>
      _$DeviceApnsTokensFromJson(json);
}

