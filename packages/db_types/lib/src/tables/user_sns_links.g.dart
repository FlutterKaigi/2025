// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_sns_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSnsLinks _$UserSnsLinksFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UserSnsLinks',
      json,
      ($checkedConvert) {
        final val = _UserSnsLinks(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          snsType: $checkedConvert(
            'sns_type',
            (v) => $enumDecode(_$SnsTypeEnumMap, v),
          ),
          value: $checkedConvert('value', (v) => v as String),
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
        'snsType': 'sns_type',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$UserSnsLinksToJson(
  _UserSnsLinks instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'sns_type': _$SnsTypeEnumMap[instance.snsType]!,
  'value': instance.value,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
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
