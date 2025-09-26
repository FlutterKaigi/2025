// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_venues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionVenues _$SessionVenuesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SessionVenues', json, ($checkedConvert) {
      final val = _SessionVenues(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SessionVenuesToJson(_SessionVenues instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
