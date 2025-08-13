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
                .map((e) => UserSnsLinks.fromJson(e as Map<String, dynamic>))
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
