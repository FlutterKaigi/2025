// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketTypesResponse _$TicketTypesResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TicketTypesResponse', json, ($checkedConvert) {
      final val = _TicketTypesResponse(
        ticketTypes: $checkedConvert(
          'ticket_types',
          (v) => (v as List<dynamic>)
              .map((e) => TicketTypes.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'ticketTypes': 'ticket_types'});

Map<String, dynamic> _$TicketTypesResponseToJson(
  _TicketTypesResponse instance,
) => <String, dynamic>{'ticket_types': instance.ticketTypes};
