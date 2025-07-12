// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'stripe_webhook_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StripeWebhookLogs _$StripeWebhookLogsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_StripeWebhookLogs',
      json,
      ($checkedConvert) {
        final val = _StripeWebhookLogs(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          stripeEventId: $checkedConvert('stripe_event_id', (v) => v as String),
          eventType: $checkedConvert('event_type', (v) => v as String),
          paymentIntentId: $checkedConvert(
            'payment_intent_id',
            (v) => v as String?,
          ),
          processed: $checkedConvert('processed', (v) => v as bool),
          errorMessage: $checkedConvert('error_message', (v) => v as String?),
          rawData: $checkedConvert(
            'raw_data',
            (v) => v as Map<String, dynamic>,
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stripeEventId': 'stripe_event_id',
        'eventType': 'event_type',
        'paymentIntentId': 'payment_intent_id',
        'errorMessage': 'error_message',
        'rawData': 'raw_data',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$StripeWebhookLogsToJson(_StripeWebhookLogs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stripe_event_id': instance.stripeEventId,
      'event_type': instance.eventType,
      'payment_intent_id': instance.paymentIntentId,
      'processed': instance.processed,
      'error_message': instance.errorMessage,
      'raw_data': instance.rawData,
      'created_at': instance.createdAt.toIso8601String(),
    };
