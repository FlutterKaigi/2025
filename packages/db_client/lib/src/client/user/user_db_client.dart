import 'package:db_client/src/client/user/model/user_and_user_roles.dart';
import 'package:db_client/src/exception/db_exception.dart';
import 'package:db_client/src/interop/hyperdrive.dart';
import 'package:db_types/db_types.dart';

class UserDbClient {
  UserDbClient({required HyperdrivePg db}) : _db = db;

  final HyperdrivePg _db;

  Future<UserAndUserRoles> getUserAndUserRoles(String userId) async {
    final result = await _db.query(
      query: r'''
SELECT
  u.*,
  json_agg(ur.role) AS roles
FROM
  public.users AS u
  LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
WHERE
  u.id = $1
GROUP BY u.id;
''',
      values: [userId],
    );
    final data = result.unwrap();
    if (data.isEmpty) {
      throw const DbException(DbExceptionType.notFound);
    }
    return UserAndUserRoles.fromJson(data.first);
  }

  /// ユーザーのロールを更新する
  Future<void> updateUserRoles(
    String userId,
    List<Role> newRoles,
  ) async {
    final result = await _db.query(
      query: r'SELECT replace_user_roles($1, $2)',
      values: [userId, newRoles.map((e) => e.name).toList()],
    );
    result.unwrap();
  }
}
