// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'entry_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryLogs _$EntryLogsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_EntryLogs',
  json,
  ($checkedConvert) {
    final val = _EntryLogs(
      ticketPurchaseId: $checkedConvert(
        'ticket_purchase_id',
        (v) => v as String,
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketPurchaseId': 'ticket_purchase_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$EntryLogsToJson(
  _EntryLogs instance,
) => <String, dynamic>{
  'ticket_purchase_id': instance.ticketPurchaseId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
