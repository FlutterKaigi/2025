// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'users_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersListRequest _$UsersListRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UsersListRequest', json, ($checkedConvert) {
      final val = _UsersListRequest(
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        offset: $checkedConvert('offset', (v) => (v as num).toInt()),
        email: $checkedConvert('email', (v) => v as String?),
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$RoleEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UsersListRequestToJson(_UsersListRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'email': instance.email,
      'roles': instance.roles?.map((e) => _$RoleEnumMap[e]!).toList(),
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.staff: 'staff',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
  Role.viewer: 'viewer',
  Role.attendee: 'attendee',
};
