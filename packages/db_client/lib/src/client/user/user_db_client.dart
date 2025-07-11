import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class UserDbClient {
  UserDbClient({required Connection connection}) : _connection = connection;

  final Connection _connection;

  Future<UserAndUserRoles> getUserAndUserRoles(String userId) async {
    final result = await _connection.execute(
      Sql.named('''
SELECT
  to_json(u.*) AS user,
  json_agg(ur.role) AS roles
FROM
  public.users AS u
  LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
WHERE
  u.id = @user_id
GROUP BY u.id
LIMIT 1;
'''),
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
  }) async {
    final queryBuffer = StringBuffer();
    queryBuffer.write('''
SELECT
  to_json(u.*) AS user,
  json_agg(ur.role) AS roles,
  au.email AS email,
  au.raw_app_meta_data->>'avatar_url' AS avatar_url,
  au.raw_app_meta_data->>'name' AS name,
FROM
  public.users AS u
  LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
  LEFT JOIN auth.users AS au ON u.id = au.id
''');
    final parameter = <String, dynamic>{};
    if (email != null) {
      queryBuffer.write('WHERE u.email LIKE @email');
      parameter['email'] = email;
    }
    if (roles != null) {
      queryBuffer.write('WHERE ur.role = @roles');
      parameter['roles'] = roles.map((e) => e.name).toList();
    }

    queryBuffer.write('GROUP BY u.id');

    final result = await _connection.execute(
      Sql.named(queryBuffer.toString()),
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
    final result = await _connection.execute(
      Sql.named('''
SELECT replace_user_roles(@user_id, @new_roles)
'''),
      parameters: {
        'user_id': userId,
        'new_roles': newRoles.map((e) => e.name).toList(),
      },
    );
    if (result.affectedRows != 1) {
      throw PgException(
        'User not found',
      );
    }
  }
}
