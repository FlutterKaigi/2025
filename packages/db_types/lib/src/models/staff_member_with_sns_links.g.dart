// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'staff_member_with_sns_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffMemberWithSnsLinks _$StaffMemberWithSnsLinksFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_StaffMemberWithSnsLinks',
  json,
  ($checkedConvert) {
    final val = _StaffMemberWithSnsLinks(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      iconName: $checkedConvert('icon_name', (v) => v as String),
      iconUrl: $checkedConvert('icon_url', (v) => v as String),
      greeting: $checkedConvert('greeting', (v) => v as String?),
      snsLinks: $checkedConvert(
        'sns_links',
        (v) => (v as List<dynamic>)
            .map((e) => SnsLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'iconName': 'icon_name',
    'iconUrl': 'icon_url',
    'snsLinks': 'sns_links',
  },
);

Map<String, dynamic> _$StaffMemberWithSnsLinksToJson(
  _StaffMemberWithSnsLinks instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon_name': instance.iconName,
  'icon_url': instance.iconUrl,
  'greeting': instance.greeting,
  'sns_links': instance.snsLinks,
};

_SnsLink _$SnsLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SnsLink', json, ($checkedConvert) {
      final val = _SnsLink(
        type: $checkedConvert('type', (v) => $enumDecode(_$SnsTypeEnumMap, v)),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SnsLinkToJson(_SnsLink instance) => <String, dynamic>{
  'type': _$SnsTypeEnumMap[instance.type]!,
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
