// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_checkout_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketCheckoutSessionResponse _$TicketCheckoutSessionResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TicketCheckoutSessionResponse', json, ($checkedConvert) {
  final val = _TicketCheckoutSessionResponse(
    session: $checkedConvert(
      'session',
      (v) => TicketCheckoutSessions.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TicketCheckoutSessionResponseToJson(
  _TicketCheckoutSessionResponse instance,
) => <String, dynamic>{'session': instance.session};
