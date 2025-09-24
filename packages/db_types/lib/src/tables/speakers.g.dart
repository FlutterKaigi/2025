// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'speakers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Speakers _$SpeakersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Speakers', json, ($checkedConvert) {
      final val = _Speakers(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        avatarName: $checkedConvert('avatar_name', (v) => v as String?),
        xId: $checkedConvert('x_id', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'avatarName': 'avatar_name', 'xId': 'x_id'});

Map<String, dynamic> _$SpeakersToJson(_Speakers instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_name': instance.avatarName,
  'x_id': instance.xId,
};
