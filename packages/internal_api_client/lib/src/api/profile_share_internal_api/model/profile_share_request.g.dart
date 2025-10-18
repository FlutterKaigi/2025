// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_share_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileShareRequest _$ProfileShareRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileShareRequest',
      json,
      ($checkedConvert) {
        final val = _ProfileShareRequest(
          profileId: $checkedConvert('profile_id', (v) => v as String),
          anotherProfileId: $checkedConvert(
            'another_profile_id',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'profileId': 'profile_id',
        'anotherProfileId': 'another_profile_id',
      },
    );

Map<String, dynamic> _$ProfileShareRequestToJson(
  _ProfileShareRequest instance,
) => <String, dynamic>{
  'profile_id': instance.profileId,
  'another_profile_id': instance.anotherProfileId,
};
