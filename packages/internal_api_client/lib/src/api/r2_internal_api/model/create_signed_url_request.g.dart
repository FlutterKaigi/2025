// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'create_signed_url_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateSignedUrlRequest _$CreateSignedUrlRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CreateSignedUrlRequest',
  json,
  ($checkedConvert) {
    final val = _CreateSignedUrlRequest(
      key: $checkedConvert('key', (v) => v as String),
      size: $checkedConvert('size', (v) => (v as num).toInt()),
      mimeType: $checkedConvert('mime_type', (v) => v as String),
      variant: $checkedConvert('variant', (v) => v as String),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'mimeType': 'mime_type', 'expiresIn': 'expires_in'},
);

Map<String, dynamic> _$CreateSignedUrlRequestToJson(
  _CreateSignedUrlRequest instance,
) => <String, dynamic>{
  'key': instance.key,
  'size': instance.size,
  'mime_type': instance.mimeType,
  'variant': instance.variant,
  'expires_in': instance.expiresIn,
};
