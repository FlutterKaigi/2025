// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_with_sns_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileWithSnsLinks _$ProfileWithSnsLinksFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileWithSnsLinks',
      json,
      ($checkedConvert) {
        final val = _ProfileWithSnsLinks(
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
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'snsLinks': 'sns_links', 'avatarUrl': 'avatar_url'},
    );

Map<String, dynamic> _$ProfileWithSnsLinksToJson(
  _ProfileWithSnsLinks instance,
) => <String, dynamic>{
  'profile': instance.profile,
  'sns_links': instance.snsLinks,
  'avatar_url': instance.avatarUrl,
};
