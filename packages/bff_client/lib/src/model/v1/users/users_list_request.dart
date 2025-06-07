import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_request.freezed.dart';
part 'users_list_request.g.dart';

@freezed
abstract class UsersListRequest with _$UsersListRequest {
  const factory UsersListRequest({
    @Assert('limit > 0', 'limit must be greater than 0')
    @Assert('limit <= 100', 'limit must be less than or equal to 100')
    required int limit,
    @Assert('offset >= 0', 'offset must be greater than or equal to 0')
    required int offset,
    String? email,
    List<Role>? roles,
  }) = _UsersListRequest;

  factory UsersListRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersListRequestFromJson(json);
}
