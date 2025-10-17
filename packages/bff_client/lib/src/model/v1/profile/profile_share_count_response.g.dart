// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_share_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileShareCountResponse _$ProfileShareCountResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfileShareCountResponse', json, ($checkedConvert) {
  final val = _ProfileShareCountResponse(
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ProfileShareCountResponseToJson(
  _ProfileShareCountResponse instance,
) => <String, dynamic>{'count': instance.count};
