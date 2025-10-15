// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketType _$TicketTypeFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_TicketType',
  json,
  ($checkedConvert) {
    final val = _TicketType(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      status: $checkedConvert(
        'status',
        (v) => TicketStatus.fromJson(v as Map<String, dynamic>),
      ),
      stripePriceId: $checkedConvert('stripe_price_id', (v) => v as String),
      isEntryAllowed: $checkedConvert('is_entry_allowed', (v) => v as bool),
      description: $checkedConvert('description', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'stripePriceId': 'stripe_price_id',
    'isEntryAllowed': 'is_entry_allowed',
  },
);

Map<String, dynamic> _$TicketTypeToJson(_TicketType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'stripe_price_id': instance.stripePriceId,
      'is_entry_allowed': instance.isEntryAllowed,
      'description': instance.description,
    };

TicketStatusSelling _$TicketStatusSellingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketStatusSelling',
      json,
      ($checkedConvert) {
        final val = TicketStatusSelling(
          isFewRemaining: $checkedConvert('is_few_remaining', (v) => v as bool),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'isFewRemaining': 'is_few_remaining',
        r'$type': 'type',
      },
    );

Map<String, dynamic> _$TicketStatusSellingToJson(
  TicketStatusSelling instance,
) => <String, dynamic>{
  'is_few_remaining': instance.isFewRemaining,
  'type': instance.$type,
};

TicketStatusSoldOut _$TicketStatusSoldOutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketStatusSoldOut', json, ($checkedConvert) {
      final val = TicketStatusSoldOut(
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$TicketStatusSoldOutToJson(
  TicketStatusSoldOut instance,
) => <String, dynamic>{'type': instance.$type};

TicketStatusNotSelling _$TicketStatusNotSellingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TicketStatusNotSelling', json, ($checkedConvert) {
  final val = TicketStatusNotSelling(
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$TicketStatusNotSellingToJson(
  TicketStatusNotSelling instance,
) => <String, dynamic>{'type': instance.$type};
