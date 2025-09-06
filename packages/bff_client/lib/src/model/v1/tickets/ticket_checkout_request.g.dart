// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketCheckoutRequest _$TicketCheckoutRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketCheckoutRequest',
  json,
  ($checkedConvert) {
    final val = _TicketCheckoutRequest(
      ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
      optionIds: $checkedConvert(
        'option_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      successUrl: $checkedConvert('success_url', (v) => v as String),
      cancelUrl: $checkedConvert('cancel_url', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketTypeId': 'ticket_type_id',
    'optionIds': 'option_ids',
    'successUrl': 'success_url',
    'cancelUrl': 'cancel_url',
  },
);

Map<String, dynamic> _$TicketCheckoutRequestToJson(
  _TicketCheckoutRequest instance,
) => <String, dynamic>{
  'ticket_type_id': instance.ticketTypeId,
  'option_ids': instance.optionIds,
  'success_url': instance.successUrl,
  'cancel_url': instance.cancelUrl,
};
