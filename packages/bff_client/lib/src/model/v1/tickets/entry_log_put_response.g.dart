// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'entry_log_put_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryLogPutResponse _$EntryLogPutResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_EntryLogPutResponse', json, ($checkedConvert) {
      final val = _EntryLogPutResponse(
        success: $checkedConvert('success', (v) => v as bool),
        entryLog: $checkedConvert(
          'entry_log',
          (v) => EntryLog.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'entryLog': 'entry_log'});

Map<String, dynamic> _$EntryLogPutResponseToJson(
  _EntryLogPutResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'entry_log': instance.entryLog,
};
