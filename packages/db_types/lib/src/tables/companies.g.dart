// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Companies _$CompaniesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Companies',
  json,
  ($checkedConvert) {
    final val = _Companies(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      logoName: $checkedConvert('logo_name', (v) => v as String),
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
    'logoName': 'logo_name',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$CompaniesToJson(
  _Companies instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_name': instance.logoName,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
