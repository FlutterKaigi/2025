// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sns_link_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SnsLinkData _$SnsLinkDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SnsLinkData', json, ($checkedConvert) {
      final val = _SnsLinkData(
        snsType: $checkedConvert(
          'sns_type',
          (v) => $enumDecode(_$SnsTypeEnumMap, v),
        ),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'snsType': 'sns_type'});

Map<String, dynamic> _$SnsLinkDataToJson(_SnsLinkData instance) =>
    <String, dynamic>{
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
