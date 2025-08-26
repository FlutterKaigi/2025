// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profiles _$ProfilesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Profiles',
  json,
  ($checkedConvert) {
    final val = _Profiles(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      comment: $checkedConvert('comment', (v) => v as String),
      isAdult: $checkedConvert('is_adult', (v) => v as bool),
      avatarKey: $checkedConvert('avatar_key', (v) => v as String?),
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
    'isAdult': 'is_adult',
    'avatarKey': 'avatar_key',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ProfilesToJson(_Profiles instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'comment': instance.comment,
  'is_adult': instance.isAdult,
  'avatar_key': instance.avatarKey,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
