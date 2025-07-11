// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'cursor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cursor _$CursorFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Cursor',
  json,
  ($checkedConvert) {
    final val = _Cursor(
      type: $checkedConvert('type', (v) => $enumDecode(_$CursorTypeEnumMap, v)),
      id: $checkedConvert('id', (v) => v as String),
    );
    return val;
  },
);

Map<String, dynamic> _$CursorToJson(_Cursor instance) => <String, dynamic>{
  'type': _$CursorTypeEnumMap[instance.type]!,
  'id': instance.id,
};

const _$CursorTypeEnumMap = {CursorType.paging: 'paging'};
