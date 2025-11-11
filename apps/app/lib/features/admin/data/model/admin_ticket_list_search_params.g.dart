// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_ticket_list_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTicketListSearchParams _$AdminTicketListSearchParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AdminTicketListSearchParams',
  json,
  ($checkedConvert) {
    final val = _AdminTicketListSearchParams(
      userId: $checkedConvert('user_id', (v) => v as String?),
      ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String?),
      status: $checkedConvert('status', (v) => v as String?),
      hasEntryLog: $checkedConvert('has_entry_log', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'ticketTypeId': 'ticket_type_id',
    'hasEntryLog': 'has_entry_log',
  },
);

Map<String, dynamic> _$AdminTicketListSearchParamsToJson(
  _AdminTicketListSearchParams instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'ticket_type_id': instance.ticketTypeId,
  'status': instance.status,
  'has_entry_log': instance.hasEntryLog,
};
