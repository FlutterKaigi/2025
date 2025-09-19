import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_and_user_roles.freezed.dart';
part 'user_and_user_roles.g.dart';

@freezed
abstract class UserAndUserRoles with _$UserAndUserRoles {
  const factory UserAndUserRoles({
    required Users user,
    required List<Role> roles,
    required AuthMetaData authMetaData,
  }) = _UserAndUserRoles;

  factory UserAndUserRoles.fromJson(Map<String, dynamic> json) =>
      _$UserAndUserRolesFromJson(json);
}

@freezed
abstract class AuthMetaData with _$AuthMetaData {
  const factory AuthMetaData({
    required String email,
    String? avatarUrl,
    required String name,
  }) = _AuthMetaData;

  factory AuthMetaData.fromJson(Map<String, dynamic> json) =>
      _$AuthMetaDataFromJson(json);
}
