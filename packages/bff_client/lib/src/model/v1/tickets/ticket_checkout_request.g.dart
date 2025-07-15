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
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map((e) => TicketOptionRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'ticketTypeId': 'ticket_type_id'},
);

Map<String, dynamic> _$TicketCheckoutRequestToJson(
  _TicketCheckoutRequest instance,
) => <String, dynamic>{
  'ticket_type_id': instance.ticketTypeId,
  'options': instance.options,
};

_TicketOptionRequest _$TicketOptionRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TicketOptionRequest', json, ($checkedConvert) {
      final val = _TicketOptionRequest(
        optionId: $checkedConvert('option_id', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'optionId': 'option_id'});

Map<String, dynamic> _$TicketOptionRequestToJson(
  _TicketOptionRequest instance,
) => <String, dynamic>{'option_id': instance.optionId, 'value': instance.value};
