// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_News _$NewsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_News',
  json,
  ($checkedConvert) {
    final val = _News(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      title: $checkedConvert('title', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      url: $checkedConvert('url', (v) => v as String?),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'endsAt': 'ends_at',
  },
);

Map<String, dynamic> _$NewsToJson(_News instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'starts_at': instance.startsAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'url': instance.url,
  'ends_at': instance.endsAt?.toIso8601String(),
};
