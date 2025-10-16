import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_tokens.freezed.dart';
part 'device_tokens.g.dart';

@freezed
abstract class DeviceTokens with _$DeviceTokens {
  const factory DeviceTokens({
    required Devices device,
    required DeviceApnsTokens? apnsToken,
    required DeviceFcmTokens? fcmToken,
    required List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens,
  }) = _DeviceTokens;

  factory DeviceTokens.fromJson(Map<String, dynamic> json) =>
    _$DeviceTokensFromJson(json);
}
