// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_with_venue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionWithVenueResponse _$SessionWithVenueResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SessionWithVenueResponse', json, ($checkedConvert) {
  final val = _SessionWithVenueResponse(
    venues: $checkedConvert(
      'venues',
      (v) => (v as List<dynamic>)
          .map((e) => VenueWithSessions.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SessionWithVenueResponseToJson(
  _SessionWithVenueResponse instance,
) => <String, dynamic>{'venues': instance.venues};

_VenueWithSessions _$VenueWithSessionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_VenueWithSessions', json, ($checkedConvert) {
      final val = _VenueWithSessions(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        sessions: $checkedConvert(
          'sessions',
          (v) => (v as List<dynamic>)
              .map(
                (e) => SessionWithSpeakers.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VenueWithSessionsToJson(_VenueWithSessions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sessions': instance.sessions,
    };
