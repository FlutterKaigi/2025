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
      url: $checkedConvert('url', (v) => v as String?),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => const DateTimeConverter().fromJson(v),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$NewsToJson(_News instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'url': instance.url,
  'starts_at': const RequiredDateTimeConverter().toJson(instance.startsAt),
  'ends_at': const DateTimeConverter().toJson(instance.endsAt),
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
