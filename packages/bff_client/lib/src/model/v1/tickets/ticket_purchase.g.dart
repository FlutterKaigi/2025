// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketPurchase _$TicketPurchaseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketPurchase',
      json,
      ($checkedConvert) {
        final val = _TicketPurchase(
          id: $checkedConvert('id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$TicketPurchaseStatusEnumMap, v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
          stripePaymentIntentId: $checkedConvert(
            'stripe_payment_intent_id',
            (v) => v as String?,
          ),
          nameplateId: $checkedConvert('nameplate_id', (v) => v as String?),
          entryLog: $checkedConvert(
            'entry_log',
            (v) =>
                v == null ? null : EntryLog.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketTypeId': 'ticket_type_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'stripePaymentIntentId': 'stripe_payment_intent_id',
        'nameplateId': 'nameplate_id',
        'entryLog': 'entry_log',
      },
    );

Map<String, dynamic> _$TicketPurchaseToJson(_TicketPurchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_type_id': instance.ticketTypeId,
      'status': _$TicketPurchaseStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'stripe_payment_intent_id': instance.stripePaymentIntentId,
      'nameplate_id': instance.nameplateId,
      'entry_log': instance.entryLog,
    };

const _$TicketPurchaseStatusEnumMap = {
  TicketPurchaseStatus.completed: 'completed',
  TicketPurchaseStatus.refunded: 'refunded',
};
