// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'tickets_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketsListResponse _$TicketsListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TicketsListResponse', json, ($checkedConvert) {
      final val = _TicketsListResponse(
        tickets: $checkedConvert(
          'tickets',
          (v) => (v as List<dynamic>)
              .map(
                (e) => TicketItemWithUser.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TicketsListResponseToJson(
  _TicketsListResponse instance,
) => <String, dynamic>{'tickets': instance.tickets};

TicketPurchaseItemWithUser _$TicketPurchaseItemWithUserFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketPurchaseItemWithUser',
  json,
  ($checkedConvert) {
    final val = TicketPurchaseItemWithUser(
      ticketType: $checkedConvert(
        'ticket_type',
        (v) => TicketType.fromJson(v as Map<String, dynamic>),
      ),
      purchase: $checkedConvert(
        'purchase',
        (v) => TicketPurchase.fromJson(v as Map<String, dynamic>),
      ),
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map((e) => TicketOption.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      user: $checkedConvert(
        'user',
        (v) => UserAndUserRoles.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'ticketType': 'ticket_type', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$TicketPurchaseItemWithUserToJson(
  TicketPurchaseItemWithUser instance,
) => <String, dynamic>{
  'ticket_type': instance.ticketType,
  'purchase': instance.purchase,
  'options': instance.options,
  'user': instance.user,
  'runtimeType': instance.$type,
};

TicketCheckoutItemWithUser _$TicketCheckoutItemWithUserFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketCheckoutItemWithUser',
  json,
  ($checkedConvert) {
    final val = TicketCheckoutItemWithUser(
      ticketType: $checkedConvert(
        'ticket_type',
        (v) => TicketType.fromJson(v as Map<String, dynamic>),
      ),
      checkout: $checkedConvert(
        'checkout',
        (v) => TicketCheckout.fromJson(v as Map<String, dynamic>),
      ),
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map((e) => TicketOption.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      user: $checkedConvert(
        'user',
        (v) => UserAndUserRoles.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'ticketType': 'ticket_type', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$TicketCheckoutItemWithUserToJson(
  TicketCheckoutItemWithUser instance,
) => <String, dynamic>{
  'ticket_type': instance.ticketType,
  'checkout': instance.checkout,
  'options': instance.options,
  'user': instance.user,
  'runtimeType': instance.$type,
};
