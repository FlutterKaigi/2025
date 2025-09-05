// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'signed_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignedUrlResponse _$SignedUrlResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SignedUrlResponse', json, ($checkedConvert) {
      final val = _SignedUrlResponse(
        key: $checkedConvert('key', (v) => v as String),
        signedUrl: $checkedConvert('signed_url', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'signedUrl': 'signed_url'});

Map<String, dynamic> _$SignedUrlResponseToJson(_SignedUrlResponse instance) =>
    <String, dynamic>{'key': instance.key, 'signed_url': instance.signedUrl};
