// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_websocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWebsocketProfileSharePayload _$UserWebsocketProfileSharePayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserWebsocketProfileSharePayload',
  json,
  ($checkedConvert) {
    final val = UserWebsocketProfileSharePayload(
      profileShare: $checkedConvert(
        'profile_share',
        (v) => ProfileShareWebsocketPayload.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'profileShare': 'profile_share', r'$type': 'type'},
);

Map<String, dynamic> _$UserWebsocketProfileSharePayloadToJson(
  UserWebsocketProfileSharePayload instance,
) => <String, dynamic>{
  'profile_share': instance.profileShare,
  'type': instance.$type,
};

UserWebsocketTicketStatusPayload _$UserWebsocketTicketStatusPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserWebsocketTicketStatusPayload',
  json,
  ($checkedConvert) {
    final val = UserWebsocketTicketStatusPayload(
      ticketStatus: $checkedConvert(
        'ticket_status',
        (v) => TicketStatusPayload.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'ticketStatus': 'ticket_status', r'$type': 'type'},
);

Map<String, dynamic> _$UserWebsocketTicketStatusPayloadToJson(
  UserWebsocketTicketStatusPayload instance,
) => <String, dynamic>{
  'ticket_status': instance.ticketStatus,
  'type': instance.$type,
};

UserWebsocketEntryLogPayload _$UserWebsocketEntryLogPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserWebsocketEntryLogPayload',
  json,
  ($checkedConvert) {
    final val = UserWebsocketEntryLogPayload(
      entryLog: $checkedConvert(
        'entry_log',
        (v) => EntryLogWebsocketPayload.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'entryLog': 'entry_log', r'$type': 'type'},
);

Map<String, dynamic> _$UserWebsocketEntryLogPayloadToJson(
  UserWebsocketEntryLogPayload instance,
) => <String, dynamic>{'entry_log': instance.entryLog, 'type': instance.$type};
