// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileUpdateRequest _$ProfileUpdateRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProfileUpdateRequest',
  json,
  ($checkedConvert) {
    final val = _ProfileUpdateRequest(
      name: $checkedConvert('name', (v) => v as String?),
      comment: $checkedConvert('comment', (v) => v as String?),
      isAdult: $checkedConvert('is_adult', (v) => v as bool?),
      snsLinks: $checkedConvert(
        'sns_links',
        (v) => (v as List<dynamic>?)
            ?.map((e) => SnsLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      avatarKey: $checkedConvert('avatar_key', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'isAdult': 'is_adult',
    'snsLinks': 'sns_links',
    'avatarKey': 'avatar_key',
  },
);

Map<String, dynamic> _$ProfileUpdateRequestToJson(
  _ProfileUpdateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'comment': instance.comment,
  'is_adult': instance.isAdult,
  'sns_links': instance.snsLinks,
  'avatar_key': instance.avatarKey,
};
