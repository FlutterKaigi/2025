// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'send_websocket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendWebsocketResponse _$SendWebsocketResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SendWebsocketResponse', json, ($checkedConvert) {
  final val = _SendWebsocketResponse(
    code: $checkedConvert('code', (v) => v as String),
    message: $checkedConvert('message', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$SendWebsocketResponseToJson(
  _SendWebsocketResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'count': instance.count,
};
