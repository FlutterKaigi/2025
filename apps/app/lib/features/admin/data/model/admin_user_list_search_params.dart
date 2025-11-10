import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_list_search_params.freezed.dart';
part 'admin_user_list_search_params.g.dart';

/// ユーザー一覧の検索条件
@freezed
abstract class AdminUserListSearchParams with _$AdminUserListSearchParams {
  const factory AdminUserListSearchParams({
    String? email,
    List<Role>? roles,
  }) = _AdminUserListSearchParams;

  factory AdminUserListSearchParams.fromJson(Map<String, dynamic> json) =>
      _$AdminUserListSearchParamsFromJson(json);
}
