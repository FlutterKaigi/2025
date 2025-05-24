import 'package:bff_client/src/model/v1/users/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_item.freezed.dart';
part 'user_list_item.g.dart';

@freezed
class UserListItem with _$UserListItem {
  const factory UserListItem({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required List<UserRole> roles,
  }) = _UserListItem;

  factory UserListItem.fromJson(Map<String, dynamic> json) =>
      _$UserListItemFromJson(json);
}
