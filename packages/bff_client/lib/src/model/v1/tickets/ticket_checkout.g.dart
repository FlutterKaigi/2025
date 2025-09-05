// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketCheckout _$TicketCheckoutFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketCheckout',
      json,
      ($checkedConvert) {
        final val = _TicketCheckout(
          id: $checkedConvert('id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$TicketCheckoutStatusEnumMap, v),
          ),
          stripeCheckoutSessionId: $checkedConvert(
            'stripe_checkout_session_id',
            (v) => v as String,
          ),
          stripeCheckoutUrl: $checkedConvert(
            'stripe_checkout_url',
            (v) => v as String,
          ),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => DateTime.parse(v as String),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
          ticketCheckoutWorkflowId: $checkedConvert(
            'ticket_checkout_workflow_id',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketTypeId': 'ticket_type_id',
        'stripeCheckoutSessionId': 'stripe_checkout_session_id',
        'stripeCheckoutUrl': 'stripe_checkout_url',
        'expiresAt': 'expires_at',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'ticketCheckoutWorkflowId': 'ticket_checkout_workflow_id',
      },
    );

Map<String, dynamic> _$TicketCheckoutToJson(_TicketCheckout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_type_id': instance.ticketTypeId,
      'status': _$TicketCheckoutStatusEnumMap[instance.status]!,
      'stripe_checkout_session_id': instance.stripeCheckoutSessionId,
      'stripe_checkout_url': instance.stripeCheckoutUrl,
      'expires_at': instance.expiresAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'ticket_checkout_workflow_id': instance.ticketCheckoutWorkflowId,
    };

const _$TicketCheckoutStatusEnumMap = {
  TicketCheckoutStatus.pending: 'pending',
  TicketCheckoutStatus.completed: 'completed',
  TicketCheckoutStatus.expired: 'expired',
};
