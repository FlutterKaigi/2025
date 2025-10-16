// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'device_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceTokens _$DeviceTokensFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_DeviceTokens',
      json,
      ($checkedConvert) {
        final val = _DeviceTokens(
          device: $checkedConvert(
            'device',
            (v) => Devices.fromJson(v as Map<String, dynamic>),
          ),
          apnsToken: $checkedConvert(
            'apns_token',
            (v) => v == null
                ? null
                : DeviceApnsTokens.fromJson(v as Map<String, dynamic>),
          ),
          fcmToken: $checkedConvert(
            'fcm_token',
            (v) => v == null
                ? null
                : DeviceFcmTokens.fromJson(v as Map<String, dynamic>),
          ),
          apnsLiveActivityTokens: $checkedConvert(
            'apns_live_activity_tokens',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => DeviceApnsLiveActivityTokens.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'apnsToken': 'apns_token',
        'fcmToken': 'fcm_token',
        'apnsLiveActivityTokens': 'apns_live_activity_tokens',
      },
    );

Map<String, dynamic> _$DeviceTokensToJson(_DeviceTokens instance) =>
    <String, dynamic>{
      'device': instance.device,
      'apns_token': instance.apnsToken,
      'fcm_token': instance.fcmToken,
      'apns_live_activity_tokens': instance.apnsLiveActivityTokens,
    };
