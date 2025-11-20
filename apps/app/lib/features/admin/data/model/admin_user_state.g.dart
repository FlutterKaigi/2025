// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserState _$AdminUserStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AdminUserState', json, ($checkedConvert) {
      final val = _AdminUserState(
        user: $checkedConvert(
          'user',
          (v) => UserAndUserRoles.fromJson(v as Map<String, dynamic>),
        ),
        tickets: $checkedConvert(
          'tickets',
          (v) => (v as List<dynamic>)
              .map((e) => TicketItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminUserStateToJson(_AdminUserState instance) =>
    <String, dynamic>{'user': instance.user, 'tickets': instance.tickets};
