// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'entry_log_websocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryLogAddWebsocketPayload _$EntryLogAddWebsocketPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'EntryLogAddWebsocketPayload',
  json,
  ($checkedConvert) {
    final val = EntryLogAddWebsocketPayload(
      ticketPurchaseId: $checkedConvert(
        'ticket_purchase_id',
        (v) => v as String,
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketPurchaseId': 'ticket_purchase_id',
    'createdAt': 'created_at',
    r'$type': 'type',
  },
);

Map<String, dynamic> _$EntryLogAddWebsocketPayloadToJson(
  EntryLogAddWebsocketPayload instance,
) => <String, dynamic>{
  'ticket_purchase_id': instance.ticketPurchaseId,
  'created_at': instance.createdAt.toIso8601String(),
  'type': instance.$type,
};

EntryLogDeleteWebsocketPayload _$EntryLogDeleteWebsocketPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'EntryLogDeleteWebsocketPayload',
  json,
  ($checkedConvert) {
    final val = EntryLogDeleteWebsocketPayload(
      ticketPurchaseId: $checkedConvert(
        'ticket_purchase_id',
        (v) => v as String,
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketPurchaseId': 'ticket_purchase_id',
    r'$type': 'type',
  },
);

Map<String, dynamic> _$EntryLogDeleteWebsocketPayloadToJson(
  EntryLogDeleteWebsocketPayload instance,
) => <String, dynamic>{
  'ticket_purchase_id': instance.ticketPurchaseId,
  'type': instance.$type,
};
