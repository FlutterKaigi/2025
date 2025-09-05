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
      isActive: $checkedConvert('is_active', (v) => v as bool),
      stripePriceId: $checkedConvert('stripe_price_id', (v) => v as String),
      maxQuantity: $checkedConvert('max_quantity', (v) => (v as num?)?.toInt()),
      description: $checkedConvert('description', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'isActive': 'is_active',
    'stripePriceId': 'stripe_price_id',
    'maxQuantity': 'max_quantity',
  },
);

Map<String, dynamic> _$TicketTypeToJson(_TicketType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'is_active': instance.isActive,
      'stripe_price_id': instance.stripePriceId,
      'max_quantity': instance.maxQuantity,
      'description': instance.description,
    };
