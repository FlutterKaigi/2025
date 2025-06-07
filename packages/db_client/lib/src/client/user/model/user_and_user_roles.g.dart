// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'user_and_user_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAndUserRoles _$UserAndUserRolesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserAndUserRoles', json, ($checkedConvert) {
      final val = _UserAndUserRoles(
        user: $checkedConvert(
          'user',
          (v) => Users.fromJson(v as Map<String, dynamic>),
        ),
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$RoleEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserAndUserRolesToJson(_UserAndUserRoles instance) =>
    <String, dynamic>{
      'user': instance.user,
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
