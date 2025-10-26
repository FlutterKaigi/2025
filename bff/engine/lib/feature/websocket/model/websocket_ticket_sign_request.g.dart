// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'websocket_ticket_sign_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsocketTicketSignRequestUser _$WebsocketTicketSignRequestUserFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WebsocketTicketSignRequestUser', json, ($checkedConvert) {
  final val = WebsocketTicketSignRequestUser(
    userId: $checkedConvert('user_id', (v) => v as String),
    expiration: $checkedConvert(
      'expiration',
      (v) => const DurationInSecondsConverter().fromJson((v as num).toInt()),
    ),
  );
  return val;
}, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$WebsocketTicketSignRequestUserToJson(
  WebsocketTicketSignRequestUser instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'expiration': const DurationInSecondsConverter().toJson(instance.expiration),
};
