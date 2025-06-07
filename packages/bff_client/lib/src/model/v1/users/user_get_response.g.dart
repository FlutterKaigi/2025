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
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$RoleEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserGetResponseToJson(_UserGetResponse instance) =>
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
