// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'put_checkout_sesson_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PutCheckoutSessonRequest _$PutCheckoutSessonRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PutCheckoutSessonRequest',
  json,
  ($checkedConvert) {
    final val = _PutCheckoutSessonRequest(
      successUrl: $checkedConvert('success_url', (v) => v as String),
      cancelUrl: $checkedConvert('cancel_url', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      ticketTypeId: $checkedConvert('ticket_type_id', (v) => v as String),
      ticketOptionIds: $checkedConvert(
        'ticket_option_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'successUrl': 'success_url',
    'cancelUrl': 'cancel_url',
    'userId': 'user_id',
    'ticketTypeId': 'ticket_type_id',
    'ticketOptionIds': 'ticket_option_ids',
  },
);

Map<String, dynamic> _$PutCheckoutSessonRequestToJson(
  _PutCheckoutSessonRequest instance,
) => <String, dynamic>{
  'success_url': instance.successUrl,
  'cancel_url': instance.cancelUrl,
  'user_id': instance.userId,
  'ticket_type_id': instance.ticketTypeId,
  'ticket_option_ids': instance.ticketOptionIds,
};
