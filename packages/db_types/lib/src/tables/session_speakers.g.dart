// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_speakers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionSpeakers _$SessionSpeakersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SessionSpeakers',
      json,
      ($checkedConvert) {
        final val = _SessionSpeakers(
          sessionId: $checkedConvert('session_id', (v) => v as String),
          speakerId: $checkedConvert('speaker_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'sessionId': 'session_id', 'speakerId': 'speaker_id'},
    );

Map<String, dynamic> _$SessionSpeakersToJson(_SessionSpeakers instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'speaker_id': instance.speakerId,
    };
