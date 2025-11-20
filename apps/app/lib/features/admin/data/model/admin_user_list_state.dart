import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_list_state.freezed.dart';
part 'admin_user_list_state.g.dart';

@freezed
abstract class AdminUserListState with _$AdminUserListState {
  const factory AdminUserListState({
    required List<UserAndUserRoles> users,
    required bool hasMore,
  }) = _AdminUserListState;

  factory AdminUserListState.fromJson(Map<String, dynamic> json) =>
    _$AdminUserListStateFromJson(json);
}
