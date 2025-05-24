import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('staff')
  staff,
  @JsonValue('sponsor')
  sponsor,
  @JsonValue('speaker')
  speaker,
  @JsonValue('viewer')
  viewer,
  @JsonValue('attendee')
  attendee;

  String toJson() => _$UserRoleEnumMap[this]!;
  static UserRole fromJson(String json) => _$UserRoleEnumMap.entries
      .firstWhere((element) => element.value == json)
      .key;
}

// Manual serialization logic as json_serializable doesn't directly support enum serialization the way we need for fromJson.
const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.staff: 'staff',
  UserRole.sponsor: 'sponsor',
  UserRole.speaker: 'speaker',
  UserRole.viewer: 'viewer',
  UserRole.attendee: 'attendee',
};
