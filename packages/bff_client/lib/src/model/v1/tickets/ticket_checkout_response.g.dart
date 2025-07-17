// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketCheckoutResponse _$TicketCheckoutResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketCheckoutResponse',
  json,
  ($checkedConvert) {
    final val = _TicketCheckoutResponse(
      checkoutSessionId: $checkedConvert(
        'checkout_session_id',
        (v) => v as String,
      ),
      stripeCheckoutUrl: $checkedConvert(
        'stripe_checkout_url',
        (v) => v as String,
      ),
      totalAmount: $checkedConvert('total_amount', (v) => (v as num).toInt()),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutSessionId': 'checkout_session_id',
    'stripeCheckoutUrl': 'stripe_checkout_url',
    'totalAmount': 'total_amount',
    'expiresAt': 'expires_at',
  },
);

Map<String, dynamic> _$TicketCheckoutResponseToJson(
  _TicketCheckoutResponse instance,
) => <String, dynamic>{
  'checkout_session_id': instance.checkoutSessionId,
  'stripe_checkout_url': instance.stripeCheckoutUrl,
  'total_amount': instance.totalAmount,
  'expires_at': instance.expiresAt.toIso8601String(),
};
