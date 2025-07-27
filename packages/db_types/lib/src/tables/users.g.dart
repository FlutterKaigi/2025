// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Users _$UsersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Users', json, ($checkedConvert) {
      final val = _Users(
        id: $checkedConvert('id', (v) => v as String),
        createdAt: $checkedConvert(
          'created_at',
          (v) => const RequiredDateTimeConverter().fromJson(v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$UsersToJson(_Users instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
