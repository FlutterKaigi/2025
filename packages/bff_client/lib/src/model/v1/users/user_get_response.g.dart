// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserGetResponse _$UserGetResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserGetResponse', json, ($checkedConvert) {
      final val = _UserGetResponse(
        user: $checkedConvert(
          'user',
          (v) => Users.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserGetResponseToJson(_UserGetResponse instance) =>
    <String, dynamic>{'user': instance.user};
