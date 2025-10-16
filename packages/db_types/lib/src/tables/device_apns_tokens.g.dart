// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'device_apns_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceApnsTokens _$DeviceApnsTokensFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_DeviceApnsTokens',
      json,
      ($checkedConvert) {
        final val = _DeviceApnsTokens(
          id: $checkedConvert('id', (v) => v as String),
          deviceId: $checkedConvert('device_id', (v) => v as String),
          token: $checkedConvert('token', (v) => v as String),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'deviceId': 'device_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$DeviceApnsTokensToJson(
  _DeviceApnsTokens instance,
) => <String, dynamic>{
  'id': instance.id,
  'device_id': instance.deviceId,
  'token': instance.token,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
