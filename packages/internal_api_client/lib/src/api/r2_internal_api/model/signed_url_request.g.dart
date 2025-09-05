// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'signed_url_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignedUrlRequestPut _$SignedUrlRequestPutFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignedUrlRequestPut',
      json,
      ($checkedConvert) {
        final val = SignedUrlRequestPut(
          key: $checkedConvert('key', (v) => v as String),
          extension: $checkedConvert('extension', (v) => v as String),
          contentLength: $checkedConvert(
            'content_length',
            (v) => (v as num).toInt(),
          ),
          mimeType: $checkedConvert('mime_type', (v) => v as String),
          expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'contentLength': 'content_length',
        'mimeType': 'mime_type',
        'expiresIn': 'expires_in',
        r'$type': 'type',
      },
    );

Map<String, dynamic> _$SignedUrlRequestPutToJson(
  SignedUrlRequestPut instance,
) => <String, dynamic>{
  'key': instance.key,
  'extension': instance.extension,
  'content_length': instance.contentLength,
  'mime_type': instance.mimeType,
  'expires_in': instance.expiresIn,
  'type': instance.$type,
};

SignedUrlRequestGet _$SignedUrlRequestGetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignedUrlRequestGet',
      json,
      ($checkedConvert) {
        final val = SignedUrlRequestGet(
          key: $checkedConvert('key', (v) => v as String),
          expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'expiresIn': 'expires_in', r'$type': 'type'},
    );

Map<String, dynamic> _$SignedUrlRequestGetToJson(
  SignedUrlRequestGet instance,
) => <String, dynamic>{
  'key': instance.key,
  'expires_in': instance.expiresIn,
  'type': instance.$type,
};
