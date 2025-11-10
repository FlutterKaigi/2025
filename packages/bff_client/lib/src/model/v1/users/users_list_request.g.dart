// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'users_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersListRequest _$UsersListRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UsersListRequest', json, ($checkedConvert) {
      final val = _UsersListRequest(
        limit: $checkedConvert(
          'limit',
          (v) => const IntStringJsonConverter().fromJson(v as String),
        ),
        offset: $checkedConvert(
          'offset',
          (v) => _$JsonConverterFromJson<String, int>(
            v,
            const IntStringJsonConverter().fromJson,
          ),
        ),
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
      'limit': const IntStringJsonConverter().toJson(instance.limit),
      'offset': _$JsonConverterToJson<String, int>(
        instance.offset,
        const IntStringJsonConverter().toJson,
      ),
      'email': instance.email,
      'roles': instance.roles?.map((e) => _$RoleEnumMap[e]!).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.staff: 'staff',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
  Role.viewer: 'viewer',
  Role.attendee: 'attendee',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
