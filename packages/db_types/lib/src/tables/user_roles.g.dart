// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRoles _$UserRolesFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_UserRoles',
  json,
  ($checkedConvert) {
    final val = _UserRoles(
      userId: $checkedConvert('user_id', (v) => v as String),
      role: $checkedConvert('role', (v) => $enumDecode(_$RoleEnumMap, v)),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'userId': 'user_id', 'createdAt': 'created_at'},
);

Map<String, dynamic> _$UserRolesToJson(
  _UserRoles instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'role': _$RoleEnumMap[instance.role]!,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.staff: 'staff',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
  Role.viewer: 'viewer',
  Role.attendee: 'attendee',
};
