// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'device_apns_live_activity_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceApnsLiveActivityTokens _$DeviceApnsLiveActivityTokensFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_DeviceApnsLiveActivityTokens',
  json,
  ($checkedConvert) {
    final val = _DeviceApnsLiveActivityTokens(
      deviceId: $checkedConvert('device_id', (v) => v as String),
      token: $checkedConvert('token', (v) => v as String),
      type: $checkedConvert(
        'type',
        (v) => $enumDecode(_$ApnsLiveActivityTokenTypeEnumMap, v),
      ),
      topic: $checkedConvert('topic', (v) => v as String),
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

Map<String, dynamic> _$DeviceApnsLiveActivityTokensToJson(
  _DeviceApnsLiveActivityTokens instance,
) => <String, dynamic>{
  'device_id': instance.deviceId,
  'token': instance.token,
  'type': _$ApnsLiveActivityTokenTypeEnumMap[instance.type]!,
  'topic': instance.topic,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};

const _$ApnsLiveActivityTokenTypeEnumMap = {
  ApnsLiveActivityTokenType.start: 'start',
  ApnsLiveActivityTokenType.update: 'update',
};
