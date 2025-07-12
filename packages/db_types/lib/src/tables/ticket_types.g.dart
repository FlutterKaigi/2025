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
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      saleEndsAt: $checkedConvert(
        'sale_ends_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      url: $checkedConvert('url', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxQuantity': 'max_quantity',
    'isActive': 'is_active',
    'saleStartsAt': 'sale_starts_at',
    'saleEndsAt': 'sale_ends_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketTypesToJson(_TicketTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'max_quantity': instance.maxQuantity,
      'description': instance.description,
      'is_active': instance.isActive,
      'sale_starts_at': instance.saleStartsAt?.toIso8601String(),
      'sale_ends_at': instance.saleEndsAt?.toIso8601String(),
      'url': instance.url,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
