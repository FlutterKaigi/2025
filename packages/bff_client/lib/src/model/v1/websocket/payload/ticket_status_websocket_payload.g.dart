// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_status_websocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketStatusPayload _$TicketStatusPayloadFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketStatusPayload',
      json,
      ($checkedConvert) {
        final val = _TicketStatusPayload(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$TicketStatusTypeEnumMap, v),
          ),
<<<<<<< HEAD
=======
          stripePaymentIntentId: $checkedConvert(
            'stripe_payment_intent_id',
            (v) => v as String?,
          ),
          nameplateId: $checkedConvert('nameplate_id', (v) => v as String?),
>>>>>>> 7032607ba9e651a2584c160012a90175567f270b
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
<<<<<<< HEAD
          stripePaymentIntentId: $checkedConvert(
            'stripe_payment_intent_id',
            (v) => v as String?,
          ),
          nameplateId: $checkedConvert('nameplate_id', (v) => v as String?),
=======
>>>>>>> 7032607ba9e651a2584c160012a90175567f270b
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'ticketTypeId': 'ticket_type_id',
<<<<<<< HEAD
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'stripePaymentIntentId': 'stripe_payment_intent_id',
        'nameplateId': 'nameplate_id',
=======
        'stripePaymentIntentId': 'stripe_payment_intent_id',
        'nameplateId': 'nameplate_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
>>>>>>> 7032607ba9e651a2584c160012a90175567f270b
      },
    );

Map<String, dynamic> _$TicketStatusPayloadToJson(
  _TicketStatusPayload instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'ticket_type_id': instance.ticketTypeId,
  'status': _$TicketStatusTypeEnumMap[instance.status]!,
<<<<<<< HEAD
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'stripe_payment_intent_id': instance.stripePaymentIntentId,
  'nameplate_id': instance.nameplateId,
=======
  'stripe_payment_intent_id': instance.stripePaymentIntentId,
  'nameplate_id': instance.nameplateId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
>>>>>>> 7032607ba9e651a2584c160012a90175567f270b
};

const _$TicketStatusTypeEnumMap = {
  TicketStatusType.completed: 'completed',
  TicketStatusType.refunded: 'refunded',
};
