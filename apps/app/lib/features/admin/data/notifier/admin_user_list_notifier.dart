import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/admin/data/model/admin_user_list_search_params.dart';
import 'package:app/features/admin/data/model/admin_user_list_state.dart';
import 'package:db_types/db_types.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_user_list_notifier.g.dart';

/// ユーザー一覧を管理するNotifier（ページネーション対応）
@riverpod
class AdminUserList extends _$AdminUserList {
  static const _limit = 100;

  @override
  Future<AdminUserListState> build(
    AdminUserListSearchParams searchParams,
  ) async {
    final client = ref.watch(bffClientProvider);
    final response = await ApiException.transform(
      () => client.v1.users.getUserList(
        limit: _limit,
        offset: 0,
        email: searchParams.email,
        roles: searchParams.roles?.map<String>((r) => r.name).join(','),
      ),
    );
    return AdminUserListState(
      users: response.data.users,
      hasMore: response.data.users.length >= _limit,
    );
  }

  static final pagingMutation = Mutation<List<UserAndUserRoles>>();

  /// 次のページを読み込む
  Future<void> loadMore() async {
    final isLoading = ref.read(
      AdminUserList.pagingMutation.select((v) => v.isPending),
    );
    if (isLoading) {
      return;
    }
    final currentUsers = state.requireValue.users;

    state = await AsyncValue.guard(() async {
      final newUsers = await AdminUserList.pagingMutation.run(
        ref,
        (tsx) async {
          final client = tsx.get(bffClientProvider);
          final response = await ApiException.transform(
            () => client.v1.users.getUserList(
              limit: _limit,
              offset: currentUsers.length,
              email: searchParams.email,
              roles: searchParams.roles?.map<String>((r) => r.name).join(','),
            ),
          );
          return response.data.users;
        },
      );
      return AdminUserListState(
        users: [...currentUsers, ...newUsers],
        hasMore: newUsers.length >= _limit,
      );
    });
  }
}
