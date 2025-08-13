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

_SnsAccount _$SnsAccountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SnsAccount', json, ($checkedConvert) {
      final val = _SnsAccount(
        type: $checkedConvert('type', (v) => $enumDecode(_$SnsTypeEnumMap, v)),
        link: $checkedConvert('link', (v) => Uri.parse(v as String)),
      );
      return val;
    });

Map<String, dynamic> _$SnsAccountToJson(_SnsAccount instance) =>
    <String, dynamic>{
      'type': _$SnsTypeEnumMap[instance.type]!,
      'link': instance.link.toString(),
    };

const _$SnsTypeEnumMap = {
  SnsType.github: 'github',
  SnsType.x: 'x',
  SnsType.discord: 'discord',
  SnsType.medium: 'medium',
  SnsType.qiita: 'qiita',
  SnsType.zenn: 'zenn',
  SnsType.note: 'note',
  SnsType.other: 'other',
};
