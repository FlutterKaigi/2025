import 'package:db_client/db_client.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_client_provider.g.dart';

@Riverpod(keepAlive: true)
Future<DbClient> dbClient(Ref ref) async {
  final env = ref.watch(environmentsProvider);

  // ローカル環境ではSSLを無効にする
  final db = await DbClient.connect(
    env.postgresUrl,
    disableSsl: env.isLocal,
  );

  ref.onDispose(() async {
    await db.dispose();
  });

  return db;
}
