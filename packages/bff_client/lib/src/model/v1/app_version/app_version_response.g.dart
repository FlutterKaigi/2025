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
            (v) => PlatformMap.fromJson(v as Map<String, dynamic>),
          ),
          storeUrls: $checkedConvert(
            'store_urls',
            (v) => PlatformMap.fromJson(v as Map<String, dynamic>),
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

_PlatformMap _$PlatformMapFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PlatformMap', json, ($checkedConvert) {
      final val = _PlatformMap(
        ios: $checkedConvert('ios', (v) => v as String),
        android: $checkedConvert('android', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PlatformMapToJson(_PlatformMap instance) =>
    <String, dynamic>{'ios': instance.ios, 'android': instance.android};
