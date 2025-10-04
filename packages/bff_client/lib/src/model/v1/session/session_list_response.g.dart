// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionListResponse _$SessionListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SessionListResponse', json, ($checkedConvert) {
      final val = _SessionListResponse(
        sessions: $checkedConvert(
          'sessions',
          (v) => (v as List<dynamic>)
              .map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SessionListResponseToJson(
  _SessionListResponse instance,
) => <String, dynamic>{'sessions': instance.sessions};
