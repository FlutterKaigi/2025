// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketPurchases _$TicketPurchasesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TicketPurchases',
      json,
      ($checkedConvert) {
        final val = _TicketPurchases(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$TicketPurchaseStatusEnumMap, v),
          ),
          stripePaymentIntentId: $checkedConvert(
            'stripe_payment_intent_id',
            (v) => v as String?,
          ),
          nameplateId: $checkedConvert('nameplate_id', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'ticketTypeId': 'ticket_type_id',
        'stripePaymentIntentId': 'stripe_payment_intent_id',
        'nameplateId': 'nameplate_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$TicketPurchasesToJson(
  _TicketPurchases instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'ticket_type_id': instance.ticketTypeId,
  'status': _$TicketPurchaseStatusEnumMap[instance.status]!,
  'stripe_payment_intent_id': instance.stripePaymentIntentId,
  'nameplate_id': instance.nameplateId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};

const _$TicketPurchaseStatusEnumMap = {
  TicketPurchaseStatus.completed: 'completed',
  TicketPurchaseStatus.refunded: 'refunded',
};

_TicketPurchaseOptions _$TicketPurchaseOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketPurchaseOptions',
  json,
  ($checkedConvert) {
    final val = _TicketPurchaseOptions(
      id: $checkedConvert('id', (v) => v as String),
      ticketPurchaseId: $checkedConvert(
        'ticket_purchase_id',
        (v) => v as String,
      ),
      ticketOptionId: $checkedConvert('ticket_option_id', (v) => v as String),
      optionValue: $checkedConvert('option_value', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketPurchaseId': 'ticket_purchase_id',
    'ticketOptionId': 'ticket_option_id',
    'optionValue': 'option_value',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketPurchaseOptionsToJson(
  _TicketPurchaseOptions instance,
) => <String, dynamic>{
  'id': instance.id,
  'ticket_purchase_id': instance.ticketPurchaseId,
  'ticket_option_id': instance.ticketOptionId,
  'option_value': instance.optionValue,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
