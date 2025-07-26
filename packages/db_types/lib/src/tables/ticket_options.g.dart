// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketOptions _$TicketOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketOptions',
      json,
      ($checkedConvert) {
        final val = _TicketOptions(
          id: $checkedConvert('id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
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
        'ticketTypeId': 'ticket_type_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$TicketOptionsToJson(
  _TicketOptions instance,
) => <String, dynamic>{
  'id': instance.id,
  'ticket_type_id': instance.ticketTypeId,
  'name': instance.name,
  'description': instance.description,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
