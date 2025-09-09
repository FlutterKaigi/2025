// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_update_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileUpdateData _$ProfileUpdateDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileUpdateData',
      json,
      ($checkedConvert) {
        final val = _ProfileUpdateData(
          name: $checkedConvert('name', (v) => v as String),
          comment: $checkedConvert('comment', (v) => v as String),
          isAdult: $checkedConvert('is_adult', (v) => v as bool),
          avatarKey: $checkedConvert('avatar_key', (v) => v as String?),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'isAdult': 'is_adult',
        'avatarKey': 'avatar_key',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$ProfileUpdateDataToJson(_ProfileUpdateData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'is_adult': instance.isAdult,
      'avatar_key': instance.avatarKey,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
