// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'create_signed_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateSignedUrlResponse _$CreateSignedUrlResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateSignedUrlResponse', json, ($checkedConvert) {
  final val = _CreateSignedUrlResponse(
    key: $checkedConvert('key', (v) => v as String),
    signedUrl: $checkedConvert('signed_url', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'signedUrl': 'signed_url'});

Map<String, dynamic> _$CreateSignedUrlResponseToJson(
  _CreateSignedUrlResponse instance,
) => <String, dynamic>{'key': instance.key, 'signed_url': instance.signedUrl};
