// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_me_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMeGetResponse _$UserMeGetResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserMeGetResponse', json, ($checkedConvert) {
      final val = _UserMeGetResponse(
        user: $checkedConvert(
          'user',
          (v) => Users.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserMeGetResponseToJson(_UserMeGetResponse instance) =>
    <String, dynamic>{'user': instance.user};
