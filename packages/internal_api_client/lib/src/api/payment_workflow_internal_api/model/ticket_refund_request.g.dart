// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketRefundRequest _$TicketRefundRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketRefundRequest',
      json,
      ($checkedConvert) {
        final val = _TicketRefundRequest(
          ticketPurchaseId: $checkedConvert(
            'ticket_purchase_id',
            (v) => v as String,
          ),
          actorId: $checkedConvert('actor_id', (v) => v as String),
          actorName: $checkedConvert('actor_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketPurchaseId': 'ticket_purchase_id',
        'actorId': 'actor_id',
        'actorName': 'actor_name',
      },
    );

Map<String, dynamic> _$TicketRefundRequestToJson(
  _TicketRefundRequest instance,
) => <String, dynamic>{
  'ticket_purchase_id': instance.ticketPurchaseId,
  'actor_id': instance.actorId,
  'actor_name': instance.actorName,
};
