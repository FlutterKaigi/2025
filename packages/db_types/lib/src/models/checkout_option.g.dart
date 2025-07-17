// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'checkout_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutOption _$CheckoutOptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CheckoutOption', json, ($checkedConvert) {
      final val = _CheckoutOption(
        optionId: $checkedConvert('option_id', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'optionId': 'option_id'});

Map<String, dynamic> _$CheckoutOptionToJson(_CheckoutOption instance) =>
    <String, dynamic>{'option_id': instance.optionId, 'value': instance.value};
