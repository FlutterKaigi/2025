// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'speaker_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeakerListResponse _$SpeakerListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SpeakerListResponse', json, ($checkedConvert) {
      final val = _SpeakerListResponse(
        speakers: $checkedConvert(
          'speakers',
          (v) => (v as List<dynamic>)
              .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SpeakerListResponseToJson(
  _SpeakerListResponse instance,
) => <String, dynamic>{'speakers': instance.speakers};
