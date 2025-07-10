import 'package:db_client/src/client/user/user_db_client.dart';
import 'package:postgres/postgres.dart';

class DbClient {
  DbClient({required Connection connection}) : _connection = connection;

  final Connection _connection;

  UserDbClient get user => UserDbClient(connection: _connection);
}
