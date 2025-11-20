// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_user_list_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserListSearchParams _$AdminUserListSearchParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AdminUserListSearchParams', json, ($checkedConvert) {
  final val = _AdminUserListSearchParams(
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

Map<String, dynamic> _$AdminUserListSearchParamsToJson(
  _AdminUserListSearchParams instance,
) => <String, dynamic>{
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
