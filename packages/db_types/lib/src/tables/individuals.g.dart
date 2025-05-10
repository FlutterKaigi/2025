// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'individuals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Individuals _$IndividualsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Individuals',
  json,
  ($checkedConvert) {
    final val = _Individuals(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => v as String),
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
  fieldKeyMap: const {
    'userId': 'user_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$IndividualsToJson(_Individuals instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
