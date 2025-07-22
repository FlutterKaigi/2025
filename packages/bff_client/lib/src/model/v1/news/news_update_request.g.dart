// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'news_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsUpdateRequest _$NewsUpdateRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_NewsUpdateRequest',
      json,
      ($checkedConvert) {
        final val = _NewsUpdateRequest(
          title: $checkedConvert('title', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
          startsAt: $checkedConvert(
            'starts_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'startsAt': 'starts_at', 'endsAt': 'ends_at'},
    );

Map<String, dynamic> _$NewsUpdateRequestToJson(_NewsUpdateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'starts_at': instance.startsAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
    };
