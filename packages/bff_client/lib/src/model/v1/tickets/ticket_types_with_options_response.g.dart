// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_types_with_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketTypeWithOptionsItem _$TicketTypeWithOptionsItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketTypeWithOptionsItem',
  json,
  ($checkedConvert) {
    final val = _TicketTypeWithOptionsItem(
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

Map<String, dynamic> _$TicketTypeWithOptionsItemToJson(
  _TicketTypeWithOptionsItem instance,
) => <String, dynamic>{
  'ticket_type': instance.ticketType,
  'options': instance.options,
};

_TicketTypesWithOptionsResponse _$TicketTypesWithOptionsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketTypesWithOptionsResponse',
  json,
  ($checkedConvert) {
    final val = _TicketTypesWithOptionsResponse(
      ticketTypes: $checkedConvert(
        'ticket_types',
        (v) => (v as List<dynamic>)
            .map(
              (e) =>
                  TicketTypeWithOptionsItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'ticketTypes': 'ticket_types'},
);

Map<String, dynamic> _$TicketTypesWithOptionsResponseToJson(
  _TicketTypesWithOptionsResponse instance,
) => <String, dynamic>{'ticket_types': instance.ticketTypes};
