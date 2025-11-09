// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'entry_log_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryLogDeleteResponse _$EntryLogDeleteResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_EntryLogDeleteResponse', json, ($checkedConvert) {
  final val = _EntryLogDeleteResponse(
    success: $checkedConvert('success', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$EntryLogDeleteResponseToJson(
  _EntryLogDeleteResponse instance,
) => <String, dynamic>{'success': instance.success};
