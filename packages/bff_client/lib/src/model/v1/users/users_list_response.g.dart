// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'users_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersListResponse _$UsersListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UsersListResponse', json, ($checkedConvert) {
      final val = _UsersListResponse(
        users: $checkedConvert(
          'users',
          (v) => (v as List<dynamic>)
              .map((e) => UserAndUserRoles.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UsersListResponseToJson(_UsersListResponse instance) =>
    <String, dynamic>{'users': instance.users};
