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
  to_json(u.*) AS user,
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
    final parameter = <Object>[];
    if (email != null) {
      queryBuffer.write(r'WHERE u.email LIKE $1');
      parameter.add(email);
    }
    if (roles != null) {
      final parameterId = parameter.length + 1;
      queryBuffer.write('WHERE ur.role = \$$parameterId');
      parameter.add(roles.map((e) => e.name).toList());
    }

    queryBuffer.write('GROUP BY u.id');

    final result = await _db.query(
      query: queryBuffer.toString(),
      values: parameter,
    );
    return result.unwrap().map(UserAndUserRoles.fromJson).toList();
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
