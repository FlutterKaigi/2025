// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_with_sns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileWithSns _$ProfileWithSnsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProfileWithSns', json, ($checkedConvert) {
      final val = _ProfileWithSns(
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
      );
      return val;
    }, fieldKeyMap: const {'snsLinks': 'sns_links'});

Map<String, dynamic> _$ProfileWithSnsToJson(_ProfileWithSns instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'sns_links': instance.snsLinks,
    };
