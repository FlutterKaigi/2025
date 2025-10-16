import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_fcm_tokens.freezed.dart';
part 'device_fcm_tokens.g.dart';

/// FCMトークン
@freezed
abstract class DeviceFcmTokens with _$DeviceFcmTokens {
  const factory DeviceFcmTokens({
    required String deviceId,
    required String token,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _DeviceFcmTokens;

  factory DeviceFcmTokens.fromJson(Map<String, dynamic> json) =>
      _$DeviceFcmTokensFromJson(json);
}

