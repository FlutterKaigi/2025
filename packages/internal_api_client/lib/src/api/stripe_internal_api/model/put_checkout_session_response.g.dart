// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'put_checkout_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PutCheckoutSessionResponse _$PutCheckoutSessionResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PutCheckoutSessionResponse',
  json,
  ($checkedConvert) {
    final val = _PutCheckoutSessionResponse(
      id: $checkedConvert('id', (v) => v as String),
      url: $checkedConvert('url', (v) => v as String),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      status: $checkedConvert('status', (v) => v as String),
      customerEmail: $checkedConvert('customer_email', (v) => v as String),
      session: $checkedConvert('session', (v) => v as Map<String, dynamic>),
    );
    return val;
  },
  fieldKeyMap: const {
    'expiresAt': 'expires_at',
    'customerEmail': 'customer_email',
  },
);

Map<String, dynamic> _$PutCheckoutSessionResponseToJson(
  _PutCheckoutSessionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'expires_at': instance.expiresAt.toIso8601String(),
  'status': instance.status,
  'customer_email': instance.customerEmail,
  'session': instance.session,
};
