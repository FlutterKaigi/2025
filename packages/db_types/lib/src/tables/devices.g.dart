// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Devices _$DevicesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Devices',
  json,
  ($checkedConvert) {
    final val = _Devices(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      type: $checkedConvert('type', (v) => $enumDecode(_$DeviceTypeEnumMap, v)),
      name: $checkedConvert('name', (v) => v as String),
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
    'userId': 'user_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DevicesToJson(_Devices instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'type': _$DeviceTypeEnumMap[instance.type]!,
  'name': instance.name,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};

const _$DeviceTypeEnumMap = {
  DeviceType.ios: 'ios',
  DeviceType.android: 'android',
  DeviceType.web: 'web',
};
