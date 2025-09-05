// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileResponse',
      json,
      ($checkedConvert) {
        final val = _ProfileResponse(
          profile: $checkedConvert(
            'profile',
            (v) => Profiles.fromJson(v as Map<String, dynamic>),
          ),
          snsLinks: $checkedConvert(
            'sns_links',
            (v) => (v as List<dynamic>)
                .map((e) => SnsLink.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          canEditNameplate: $checkedConvert(
            'can_edit_nameplate',
            (v) => v as bool,
          ),
          nameplateNote: $checkedConvert('nameplate_note', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'snsLinks': 'sns_links',
        'canEditNameplate': 'can_edit_nameplate',
        'nameplateNote': 'nameplate_note',
      },
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'sns_links': instance.snsLinks,
      'can_edit_nameplate': instance.canEditNameplate,
      'nameplate_note': instance.nameplateNote,
    };

_Profiles _$ProfilesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Profiles',
  json,
  ($checkedConvert) {
    final val = _Profiles(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      comment: $checkedConvert('comment', (v) => v as String),
      isAdult: $checkedConvert('is_adult', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      avatarUrl: $checkedConvert(
        'avatar_url',
        (v) => v == null ? null : Uri.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'isAdult': 'is_adult',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'avatarUrl': 'avatar_url',
  },
);

Map<String, dynamic> _$ProfilesToJson(_Profiles instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'comment': instance.comment,
  'is_adult': instance.isAdult,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'avatar_url': instance.avatarUrl?.toString(),
};
