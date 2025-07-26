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
  fieldKeyMap: const {'createdAt': 'created_at', 'updatedAt': 'updated_at'},
);

Map<String, dynamic> _$CompaniesToJson(
  _Companies instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
