// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'upsert_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpsertDevice _$UpsertDeviceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UpsertDevice', json, ($checkedConvert) {
      final val = _UpsertDevice(
        id: $checkedConvert('id', (v) => v as String),
        userId: $checkedConvert('user_id', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$DeviceTypeEnumMap, v),
        ),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$UpsertDeviceToJson(_UpsertDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.ios: 'ios',
  DeviceType.android: 'android',
  DeviceType.web: 'web',
};
