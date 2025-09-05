// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sns_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SnsLink _$SnsLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SnsLink', json, ($checkedConvert) {
      final val = _SnsLink(
        snsType: $checkedConvert(
          'sns_type',
          (v) => $enumDecode(_$SnsTypeEnumMap, v),
        ),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'snsType': 'sns_type'});

Map<String, dynamic> _$SnsLinkToJson(_SnsLink instance) => <String, dynamic>{
  'sns_type': _$SnsTypeEnumMap[instance.snsType]!,
  'value': instance.value,
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
