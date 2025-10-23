// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_share.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileShare _$ProfileShareFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileShare',
      json,
      ($checkedConvert) {
        final val = _ProfileShare(
          id: $checkedConvert('id', (v) => v as String),
          fromId: $checkedConvert('from_id', (v) => v as String),
          toId: $checkedConvert('to_id', (v) => v as String),
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
        'fromId': 'from_id',
        'toId': 'to_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$ProfileShareToJson(
  _ProfileShare instance,
) => <String, dynamic>{
  'id': instance.id,
  'from_id': instance.fromId,
  'to_id': instance.toId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
