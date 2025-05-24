import 'package:bff_client/src/model/v1/users/user_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@freezed
class UserListResponse with _$UserListResponse {
  const factory UserListResponse({
    required List<UserListItem> users,
    @JsonKey(name: 'total_count') required int totalCount,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);
}
