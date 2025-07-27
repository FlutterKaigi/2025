// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_checkout_sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketCheckoutSessions _$TicketCheckoutSessionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketCheckoutSessions',
  json,
  ($checkedConvert) {
    final val = _TicketCheckoutSessions(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$TicketCheckoutStatusEnumMap, v),
      ),
      stripePaymentIntentId: $checkedConvert(
        'stripe_payment_intent_id',
        (v) => v as String?,
      ),
      stripeCheckoutSessionId: $checkedConvert(
        'stripe_checkout_session_id',
        (v) => v as String?,
      ),
      totalAmount: $checkedConvert('total_amount', (v) => (v as num).toInt()),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'ticketTypeId': 'ticket_type_id',
    'stripePaymentIntentId': 'stripe_payment_intent_id',
    'stripeCheckoutSessionId': 'stripe_checkout_session_id',
    'totalAmount': 'total_amount',
    'expiresAt': 'expires_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketCheckoutSessionsToJson(
  _TicketCheckoutSessions instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'ticket_type_id': instance.ticketTypeId,
  'status': _$TicketCheckoutStatusEnumMap[instance.status]!,
  'stripe_payment_intent_id': instance.stripePaymentIntentId,
  'stripe_checkout_session_id': instance.stripeCheckoutSessionId,
  'total_amount': instance.totalAmount,
  'expires_at': const RequiredDateTimeConverter().toJson(instance.expiresAt),
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};

const _$TicketCheckoutStatusEnumMap = {
  TicketCheckoutStatus.pending: 'pending',
  TicketCheckoutStatus.completed: 'completed',
  TicketCheckoutStatus.expired: 'expired',
  TicketCheckoutStatus.cancelled: 'cancelled',
};

_TicketCheckoutOptions _$TicketCheckoutOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketCheckoutOptions',
  json,
  ($checkedConvert) {
    final val = _TicketCheckoutOptions(
      id: $checkedConvert('id', (v) => v as String),
      checkoutSessionId: $checkedConvert(
        'checkout_session_id',
        (v) => v as String,
      ),
      ticketOptionId: $checkedConvert('ticket_option_id', (v) => v as String),
      optionValue: $checkedConvert('option_value', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutSessionId': 'checkout_session_id',
    'ticketOptionId': 'ticket_option_id',
    'optionValue': 'option_value',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketCheckoutOptionsToJson(
  _TicketCheckoutOptions instance,
) => <String, dynamic>{
  'id': instance.id,
  'checkout_session_id': instance.checkoutSessionId,
  'ticket_option_id': instance.ticketOptionId,
  'option_value': instance.optionValue,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
