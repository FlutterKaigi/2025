// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketTypes _$TicketTypesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_TicketTypes',
  json,
  ($checkedConvert) {
    final val = _TicketTypes(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      maxQuantity: $checkedConvert('max_quantity', (v) => (v as num?)?.toInt()),
      description: $checkedConvert('description', (v) => v as String?),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      saleStartsAt: $checkedConvert(
        'sale_starts_at',
        (v) => const DateTimeConverter().fromJson(v),
      ),
      saleEndsAt: $checkedConvert(
        'sale_ends_at',
        (v) => const DateTimeConverter().fromJson(v),
      ),
      stripePriceId: $checkedConvert('stripe_price_id', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxQuantity': 'max_quantity',
    'isActive': 'is_active',
    'saleStartsAt': 'sale_starts_at',
    'saleEndsAt': 'sale_ends_at',
    'stripePriceId': 'stripe_price_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketTypesToJson(
  _TicketTypes instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'max_quantity': instance.maxQuantity,
  'description': instance.description,
  'is_active': instance.isActive,
  'sale_starts_at': const DateTimeConverter().toJson(instance.saleStartsAt),
  'sale_ends_at': const DateTimeConverter().toJson(instance.saleEndsAt),
  'stripe_price_id': instance.stripePriceId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
