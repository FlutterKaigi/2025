// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketOption _$TicketOptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketOption',
      json,
      ($checkedConvert) {
        final val = _TicketOption(
          id: $checkedConvert('id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
          maxQuantity: $checkedConvert(
            'max_quantity',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketTypeId': 'ticket_type_id',
        'maxQuantity': 'max_quantity',
      },
    );

Map<String, dynamic> _$TicketOptionToJson(_TicketOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_type_id': instance.ticketTypeId,
      'name': instance.name,
      'description': instance.description,
      'max_quantity': instance.maxQuantity,
    };
