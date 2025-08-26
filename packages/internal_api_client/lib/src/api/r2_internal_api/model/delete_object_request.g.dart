// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'delete_object_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteObjectRequest _$DeleteObjectRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeleteObjectRequest', json, ($checkedConvert) {
      final val = _DeleteObjectRequest(
        key: $checkedConvert('key', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DeleteObjectRequestToJson(
  _DeleteObjectRequest instance,
) => <String, dynamic>{'key': instance.key};
