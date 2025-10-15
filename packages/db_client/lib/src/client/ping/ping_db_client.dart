import 'package:db_client/db_client.dart';

class PingDbClient {
  PingDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  Future<void> ping() async => _executor.execute('SELECT 1');
}
