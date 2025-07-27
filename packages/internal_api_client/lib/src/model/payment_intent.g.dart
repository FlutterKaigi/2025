// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentIntent _$PaymentIntentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaymentIntent',
      json,
      ($checkedConvert) {
        final val = _PaymentIntent(
          id: $checkedConvert('id', (v) => v as String),
          clientSecret: $checkedConvert('client_secret', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toInt()),
          currency: $checkedConvert('currency', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
          customerId: $checkedConvert('customer_id', (v) => v as String?),
          metadata: $checkedConvert(
            'metadata',
            (v) => v as Map<String, dynamic>?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'clientSecret': 'client_secret',
        'customerId': 'customer_id',
      },
    );

Map<String, dynamic> _$PaymentIntentToJson(_PaymentIntent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_secret': instance.clientSecret,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'customer_id': instance.customerId,
      'metadata': instance.metadata,
    };
