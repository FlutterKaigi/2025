// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_purchase_with_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTicketsWithDetailsResponse _$UserTicketsWithDetailsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UserTicketsWithDetailsResponse', json, ($checkedConvert) {
  final val = _UserTicketsWithDetailsResponse(
    tickets: $checkedConvert(
      'tickets',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                TicketPurchaseWithDetails.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$UserTicketsWithDetailsResponseToJson(
  _UserTicketsWithDetailsResponse instance,
) => <String, dynamic>{'tickets': instance.tickets};

_TicketPurchaseWithDetails _$TicketPurchaseWithDetailsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketPurchaseWithDetails',
  json,
  ($checkedConvert) {
    final val = _TicketPurchaseWithDetails(
      purchase: $checkedConvert(
        'purchase',
        (v) => TicketPurchases.fromJson(v as Map<String, dynamic>),
      ),
      ticketType: $checkedConvert(
        'ticket_type',
        (v) => TicketTypes.fromJson(v as Map<String, dynamic>),
      ),
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map((e) => TicketOptions.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'ticketType': 'ticket_type'},
);

Map<String, dynamic> _$TicketPurchaseWithDetailsToJson(
  _TicketPurchaseWithDetails instance,
) => <String, dynamic>{
  'purchase': instance.purchase,
  'ticket_type': instance.ticketType,
  'options': instance.options,
};
