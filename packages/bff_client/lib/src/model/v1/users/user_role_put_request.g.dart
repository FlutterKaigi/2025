// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_role_put_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRolePutRequest _$UserRolePutRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserRolePutRequest', json, ($checkedConvert) {
      final val = _UserRolePutRequest(
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$RoleEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserRolePutRequestToJson(_UserRolePutRequest instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((e) => _$RoleEnumMap[e]!).toList(),
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.staff: 'staff',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
  Role.viewer: 'viewer',
  Role.attendee: 'attendee',
};
