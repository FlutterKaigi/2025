import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_put_request.freezed.dart';
part 'user_role_put_request.g.dart';

@freezed
abstract class UserRolePutRequest with _$UserRolePutRequest {
  const factory UserRolePutRequest({
    required List<Role> roles,
  }) = _UserRolePutRequest;

  factory UserRolePutRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRolePutRequestFromJson(json);
}
