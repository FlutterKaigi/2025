// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'news_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsCreateRequest _$NewsCreateRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_NewsCreateRequest',
      json,
      ($checkedConvert) {
        final val = _NewsCreateRequest(
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

Map<String, dynamic> _$NewsCreateRequestToJson(_NewsCreateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'starts_at': instance.startsAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
    };
