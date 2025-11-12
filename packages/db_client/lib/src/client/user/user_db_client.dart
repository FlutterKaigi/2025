import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class UserDbClient {
  UserDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  Future<UserAndUserRoles> getUserAndUserRoles(String userId) async {
    final result = await _executor.execute(
      '''
  SELECT
    to_json(u.*) AS user,
    COALESCE(json_agg(ur.role) FILTER (WHERE ur.role IS NOT NULL), '[]'::json) AS roles,
    COALESCE(au.raw_user_meta_data, '{}'::jsonb) ||
      jsonb_build_object('is_adult', COALESCE(p.is_adult, false)) AS auth_meta_data
  FROM
    public.users AS u
    LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
    LEFT JOIN auth.users AS au ON u.id = au.id
    LEFT JOIN profiles AS p ON u.id = p.id
WHERE
  u.id = @user_id AND u.deleted_at IS NULL
  GROUP BY u.id, au.raw_user_meta_data, p.is_adult
LIMIT 1;
''',
      parameters: {
        'user_id': userId,
      },
    );
    final user = result.firstOrNull?.toColumnMap();
    if (user == null) {
      throw PgException(
        'User not found',
      );
    }
    return UserAndUserRoles.fromJson(user);
  }

  Future<List<UserAndUserRoles>> getUserList({
    required String? email,
    required List<Role>? roles,
    required int limit,
    required int offset,
    bool includeDeleted = false,
  }) async {
    final queryBuffer = StringBuffer();
    queryBuffer.write('''
  SELECT
    to_json(u.*) AS user,
    COALESCE(json_agg(ur.role) FILTER (WHERE ur.role IS NOT NULL), '[]'::json) AS roles,
    COALESCE(au.raw_user_meta_data, '{}'::jsonb) ||
      jsonb_build_object('is_adult', COALESCE(p.is_adult, false)) AS auth_meta_data
  FROM
    public.users AS u
    LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
    LEFT JOIN auth.users AS au ON u.id = au.id
    LEFT JOIN profiles AS p ON u.id = p.id
''');
    final parameter = <String, dynamic>{};
    final conditions = <String>[];

    // 論理削除されたユーザーを除外（明示的に指定された場合を除く）
    if (!includeDeleted) {
      conditions.add('u.deleted_at IS NULL');
    }

    if (email != null) {
      conditions.add('au.email LIKE @email');
      parameter['email'] = '%$email%';
    }
    if (roles != null && roles.isNotEmpty) {
      conditions.add('ur.role = ANY(@roles)');
      parameter['roles'] = roles.map((e) => e.name).toList();
    }

    if (conditions.isNotEmpty) {
      queryBuffer.write('\nWHERE ${conditions.join(' AND ')}');
    }

    queryBuffer.write('''

  GROUP BY u.id, au.raw_user_meta_data, p.is_adult
ORDER BY u.created_at DESC
LIMIT @limit OFFSET @offset
''');

    parameter['limit'] = limit;
    parameter['offset'] = offset;

    final result = await _executor.execute(
      queryBuffer.toString(),
      parameters: parameter,
    );
    return result
        .map((e) => UserAndUserRoles.fromJson(e.toColumnMap()))
        .toList();
  }

  /// ユーザーのロールを更新する
  Future<void> updateUserRoles(
    String userId,
    List<Role> newRoles,
  ) async {
    // 削除済みユーザーのロールは更新できない
    final userExists = await _executor.execute(
      'SELECT 1 FROM public.users WHERE id = @user_id AND deleted_at IS NULL',
      parameters: {'user_id': userId},
    );

    if (userExists.isEmpty) {
      throw PgException('User not found or has been deleted');
    }

    await _executor.execute(
      '''
SELECT replace_user_roles(@user_id, @new_roles)
''',
      parameters: {
        'user_id': userId,
        'new_roles': newRoles.map((e) => e.name).toList(),
      },
    );
  }

  /// ユーザーを論理削除する
  Future<void> deleteUser(String userId) async {
    await _executor.execute(
      '''
UPDATE public.users
SET deleted_at = NOW()
WHERE id = @user_id AND deleted_at IS NULL
''',
      parameters: {
        'user_id': userId,
      },
    );
  }

  /// ユーザーを復元する
  Future<void> restoreUser(String userId) async {
    await _executor.execute(
      '''
UPDATE public.users
SET deleted_at = NULL
WHERE id = @user_id AND deleted_at IS NOT NULL
''',
      parameters: {
        'user_id': userId,
      },
    );
  }
}
