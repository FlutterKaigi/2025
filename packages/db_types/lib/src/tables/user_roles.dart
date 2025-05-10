import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_roles.freezed.dart';
part 'user_roles.g.dart';

@freezed
abstract class UserRoles with _$UserRoles {
  const factory UserRoles({
    required String userId,
    required Role role,
    required DateTime createdAt,
  }) = _UserRoles;

  factory UserRoles.fromJson(Map<String, dynamic> json) =>
      _$UserRolesFromJson(json);
}

enum Role { admin, staff, sponsor, speaker, viewer, attendee }
