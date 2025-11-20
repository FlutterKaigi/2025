// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_user_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserListState _$AdminUserListStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AdminUserListState', json, ($checkedConvert) {
      final val = _AdminUserListState(
        users: $checkedConvert(
          'users',
          (v) => (v as List<dynamic>)
              .map((e) => UserAndUserRoles.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        hasMore: $checkedConvert('has_more', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'hasMore': 'has_more'});

Map<String, dynamic> _$AdminUserListStateToJson(_AdminUserListState instance) =>
    <String, dynamic>{'users': instance.users, 'has_more': instance.hasMore};
