// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_purchase_with_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketPurchaseWithDetails _$TicketPurchaseWithDetailsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketPurchaseWithDetails',
  json,
  ($checkedConvert) {
    final val = _TicketPurchaseWithDetails(
      purchase: $checkedConvert(
        'purchase',
        (v) => v == null
            ? null
            : TicketPurchases.fromJson(v as Map<String, dynamic>),
      ),
      checkoutSession: $checkedConvert(
        'checkout_session',
        (v) => v == null
            ? null
            : TicketCheckoutSessions.fromJson(v as Map<String, dynamic>),
      ),
      ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map((e) => TicketOptions.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutSession': 'checkout_session',
    'ticketTypeId': 'ticket_type_id',
  },
);

Map<String, dynamic> _$TicketPurchaseWithDetailsToJson(
  _TicketPurchaseWithDetails instance,
) => <String, dynamic>{
  'purchase': instance.purchase,
  'checkout_session': instance.checkoutSession,
  'ticket_type_id': instance.ticketTypeId,
  'options': instance.options,
};
