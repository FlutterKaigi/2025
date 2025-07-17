// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_type_with_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketTypeWithOptionsResponse _$TicketTypeWithOptionsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketTypeWithOptionsResponse',
  json,
  ($checkedConvert) {
    final val = _TicketTypeWithOptionsResponse(
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

Map<String, dynamic> _$TicketTypeWithOptionsResponseToJson(
  _TicketTypeWithOptionsResponse instance,
) => <String, dynamic>{
  'ticket_type': instance.ticketType,
  'options': instance.options,
};
