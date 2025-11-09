// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'entry_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryLog _$EntryLogFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_EntryLog',
  json,
  ($checkedConvert) {
    final val = _EntryLog(
      ticketPurchaseId: $checkedConvert(
        'ticket_purchase_id',
        (v) => v as String,
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketPurchaseId': 'ticket_purchase_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$EntryLogToJson(_EntryLog instance) => <String, dynamic>{
  'ticket_purchase_id': instance.ticketPurchaseId,
  'created_at': instance.createdAt.toIso8601String(),
};
