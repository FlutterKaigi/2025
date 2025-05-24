// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListItem _$UserListItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserListItem', json, ($checkedConvert) {
      final val = _UserListItem(
        id: $checkedConvert('id', (v) => v as String),
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        roles: $checkedConvert(
          'roles',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => $enumDecode(_$UserRoleEnumMap, e))
                  .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$UserListItemToJson(_UserListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'roles': instance.roles,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.staff: 'staff',
  UserRole.sponsor: 'sponsor',
  UserRole.speaker: 'speaker',
  UserRole.viewer: 'viewer',
  UserRole.attendee: 'attendee',
};
