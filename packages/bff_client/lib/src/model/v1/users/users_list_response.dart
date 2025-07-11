import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_response.freezed.dart';
part 'users_list_response.g.dart';

@freezed
abstract class UsersListResponse with _$UsersListResponse {
  const factory UsersListResponse({
    required List<UserAndUserRoles> users,

    /// 次の要素が存在する時に出現する
    String? nextCursor,
  }) = _UsersListResponse;

  factory UsersListResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersListResponseFromJson(json);
}
