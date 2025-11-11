// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_refund_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketRefundResponse _$TicketRefundResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TicketRefundResponse', json, ($checkedConvert) {
  final val = _TicketRefundResponse(
    workflowId: $checkedConvert('workflow_id', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'workflowId': 'workflow_id'});

Map<String, dynamic> _$TicketRefundResponseToJson(
  _TicketRefundResponse instance,
) => <String, dynamic>{'workflow_id': instance.workflowId};
