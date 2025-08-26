// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'delete_object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteObjectResponse _$DeleteObjectResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DeleteObjectResponse', json, ($checkedConvert) {
  final val = _DeleteObjectResponse(
    success: $checkedConvert('success', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$DeleteObjectResponseToJson(
  _DeleteObjectResponse instance,
) => <String, dynamic>{'success': instance.success};
