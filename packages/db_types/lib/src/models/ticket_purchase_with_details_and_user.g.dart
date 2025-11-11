// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_purchase_with_details_and_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketPurchaseWithDetailsAndUser _$TicketPurchaseWithDetailsAndUserFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketPurchaseWithDetailsAndUser',
  json,
  ($checkedConvert) {
    final val = _TicketPurchaseWithDetailsAndUser(
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
      entryLog: $checkedConvert(
        'entry_log',
        (v) => v == null ? null : EntryLogs.fromJson(v as Map<String, dynamic>),
      ),
      user: $checkedConvert(
        'user',
        (v) => UserAndUserRoles.fromJson(v as Map<String, dynamic>),
      ),
      ticketType: $checkedConvert(
        'ticket_type',
        (v) =>
            v == null ? null : TicketTypes.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutSession': 'checkout_session',
    'ticketTypeId': 'ticket_type_id',
    'entryLog': 'entry_log',
    'ticketType': 'ticket_type',
  },
);

Map<String, dynamic> _$TicketPurchaseWithDetailsAndUserToJson(
  _TicketPurchaseWithDetailsAndUser instance,
) => <String, dynamic>{
  'purchase': instance.purchase,
  'checkout_session': instance.checkoutSession,
  'ticket_type_id': instance.ticketTypeId,
  'options': instance.options,
  'entry_log': instance.entryLog,
  'user': instance.user,
  'ticket_type': instance.ticketType,
};
