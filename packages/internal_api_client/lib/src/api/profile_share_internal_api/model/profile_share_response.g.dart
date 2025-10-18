// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_share_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileShareResponse _$ProfileShareResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfileShareResponse', json, ($checkedConvert) {
  final val = _ProfileShareResponse(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ProfileShareResponseToJson(
  _ProfileShareResponse instance,
) => <String, dynamic>{'message': instance.message};
