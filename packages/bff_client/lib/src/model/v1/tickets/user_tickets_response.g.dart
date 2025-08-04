// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTicketsResponse _$UserTicketsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UserTicketsResponse',
      json,
      ($checkedConvert) {
        final val = _UserTicketsResponse(
          tickets: $checkedConvert(
            'tickets',
            (v) => (v as List<dynamic>)
                .map((e) => TicketPurchases.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          ticketCheckouts: $checkedConvert(
            'ticket_checkouts',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => TicketCheckoutSessions.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'ticketCheckouts': 'ticket_checkouts'},
    );

Map<String, dynamic> _$UserTicketsResponseToJson(
  _UserTicketsResponse instance,
) => <String, dynamic>{
  'tickets': instance.tickets,
  'ticket_checkouts': instance.ticketCheckouts,
};
