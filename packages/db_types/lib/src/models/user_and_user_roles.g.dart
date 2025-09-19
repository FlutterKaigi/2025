// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

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
        authMetaData: $checkedConvert(
          'auth_meta_data',
          (v) => AuthMetaData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'authMetaData': 'auth_meta_data'});

Map<String, dynamic> _$UserAndUserRolesToJson(_UserAndUserRoles instance) =>
    <String, dynamic>{
      'user': instance.user,
      'roles': instance.roles.map((e) => _$RoleEnumMap[e]!).toList(),
      'auth_meta_data': instance.authMetaData,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.staff: 'staff',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
  Role.viewer: 'viewer',
  Role.attendee: 'attendee',
};

_AuthMetaData _$AuthMetaDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AuthMetaData', json, ($checkedConvert) {
      final val = _AuthMetaData(
        email: $checkedConvert('email', (v) => v as String?),
        avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'avatarUrl': 'avatar_url'});

Map<String, dynamic> _$AuthMetaDataToJson(_AuthMetaData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
    };
