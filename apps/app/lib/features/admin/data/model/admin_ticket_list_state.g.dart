// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_ticket_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTicketListState _$AdminTicketListStateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AdminTicketListState', json, ($checkedConvert) {
  final val = _AdminTicketListState(
    tickets: $checkedConvert(
      'tickets',
      (v) => (v as List<dynamic>)
          .map((e) => TicketItemWithUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    hasMore: $checkedConvert('has_more', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'hasMore': 'has_more'});

Map<String, dynamic> _$AdminTicketListStateToJson(
  _AdminTicketListState instance,
) => <String, dynamic>{
  'tickets': instance.tickets,
  'has_more': instance.hasMore,
};
