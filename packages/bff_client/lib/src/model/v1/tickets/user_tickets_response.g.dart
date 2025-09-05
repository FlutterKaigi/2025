// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTicketsResponse _$UserTicketsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserTicketsResponse', json, ($checkedConvert) {
      final val = _UserTicketsResponse(
        tickets: $checkedConvert(
          'tickets',
          (v) => (v as List<dynamic>)
              .map((e) => TicketItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserTicketsResponseToJson(
  _UserTicketsResponse instance,
) => <String, dynamic>{'tickets': instance.tickets};

TicketPurchaseItem _$TicketPurchaseItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketPurchaseItem',
      json,
      ($checkedConvert) {
        final val = TicketPurchaseItem(
          purchase: $checkedConvert(
            'purchase',
            (v) => TicketPurchase.fromJson(v as Map<String, dynamic>),
          ),
          ticketType: $checkedConvert(
            'ticket_type',
            (v) => TicketType.fromJson(v as Map<String, dynamic>),
          ),
          options: $checkedConvert(
            'options',
            (v) => (v as List<dynamic>)
                .map((e) => TicketOption.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'ticketType': 'ticket_type', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$TicketPurchaseItemToJson(TicketPurchaseItem instance) =>
    <String, dynamic>{
      'purchase': instance.purchase,
      'ticket_type': instance.ticketType,
      'options': instance.options,
      'runtimeType': instance.$type,
    };

TicketCheckoutItem _$TicketCheckoutItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketCheckoutItem',
      json,
      ($checkedConvert) {
        final val = TicketCheckoutItem(
          checkout: $checkedConvert(
            'checkout',
            (v) => TicketCheckout.fromJson(v as Map<String, dynamic>),
          ),
          ticketType: $checkedConvert(
            'ticket_type',
            (v) => TicketType.fromJson(v as Map<String, dynamic>),
          ),
          options: $checkedConvert(
            'options',
            (v) => (v as List<dynamic>)
                .map((e) => TicketOption.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'ticketType': 'ticket_type', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$TicketCheckoutItemToJson(TicketCheckoutItem instance) =>
    <String, dynamic>{
      'checkout': instance.checkout,
      'ticket_type': instance.ticketType,
      'options': instance.options,
      'runtimeType': instance.$type,
    };
