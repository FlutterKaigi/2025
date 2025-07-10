import 'package:db_client/db_client.dart';
import 'package:engine/provider/environemnts_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_client_provider.g.dart';

@Riverpod(keepAlive: true)
Future<DbClient> dbClient(Ref ref, HyperdriveType type) async {
  final env = ref.watch(environemntsProvider);
  final connectionString = switch (type) {
    HyperdriveType.cache => env.hyperdriveUrl,
    HyperdriveType.noCache => env.hyperdriveNoCacheUrl,
  };
  final db = await DbClient.connect(connectionString);

  ref.onDispose(() async {
    await db.dispose();
  });

  return db;
}

/// Postgres接続先の種類
enum HyperdriveType {
  /// Cloudflare Hyperdriveにより、クエリ結果をキャッシュする
  cache,

  /// キャッシュなし
  noCache,
}
