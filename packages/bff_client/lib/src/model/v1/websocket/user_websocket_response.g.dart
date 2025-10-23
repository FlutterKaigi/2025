// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_websocket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserWebsocketResponse _$UserWebsocketResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UserWebsocketResponse', json, ($checkedConvert) {
  final val = _UserWebsocketResponse(
    url: $checkedConvert('url', (v) => v as String),
    ticket: $checkedConvert('ticket', (v) => v as String),
    expiration: $checkedConvert('expiration', (v) => (v as num).toInt()),
    responseAt: $checkedConvert(
      'response_at',
      (v) => DateTime.parse(v as String),
    ),
  );
  return val;
}, fieldKeyMap: const {'responseAt': 'response_at'});

Map<String, dynamic> _$UserWebsocketResponseToJson(
  _UserWebsocketResponse instance,
) => <String, dynamic>{
  'url': instance.url,
  'ticket': instance.ticket,
  'expiration': instance.expiration,
  'response_at': instance.responseAt.toIso8601String(),
};
