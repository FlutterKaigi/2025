// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sns_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SnsLinkRequest _$SnsLinkRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SnsLinkRequest', json, ($checkedConvert) {
      final val = _SnsLinkRequest(
        snsType: $checkedConvert('sns_type', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'snsType': 'sns_type'});

Map<String, dynamic> _$SnsLinkRequestToJson(_SnsLinkRequest instance) =>
    <String, dynamic>{'sns_type': instance.snsType, 'value': instance.value};
