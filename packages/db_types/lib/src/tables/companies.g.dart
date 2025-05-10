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
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'createdAt': 'created_at', 'updatedAt': 'updated_at'},
);

Map<String, dynamic> _$CompaniesToJson(_Companies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
