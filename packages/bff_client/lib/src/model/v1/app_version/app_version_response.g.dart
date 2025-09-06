// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'app_version_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppVersionResponse _$AppVersionResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AppVersionResponse',
      json,
      ($checkedConvert) {
        final val = _AppVersionResponse(
          minimumVersion: $checkedConvert(
            'minimum_version',
            (v) => v as String,
          ),
          storeUrls: $checkedConvert(
            'store_urls',
            (v) => Map<String, String>.from(v as Map),
          ),
          message: $checkedConvert(
            'message',
            (v) => Map<String, String>.from(v as Map),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'minimumVersion': 'minimum_version',
        'storeUrls': 'store_urls',
      },
    );

Map<String, dynamic> _$AppVersionResponseToJson(_AppVersionResponse instance) =>
    <String, dynamic>{
      'minimum_version': instance.minimumVersion,
      'store_urls': instance.storeUrls,
      'message': instance.message,
    };
