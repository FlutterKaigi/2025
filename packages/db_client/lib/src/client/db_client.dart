import 'package:db_client/src/client/user/user_db_client.dart';
import 'package:db_client/src/interop/hyperdrive.dart';

class DbClient {
  DbClient({required HyperdrivePg db}) : _db = db;
  
  final HyperdrivePg _db;

  UserDbClient get user => UserDbClient(db: _db);
}
