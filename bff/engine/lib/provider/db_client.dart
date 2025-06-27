import 'package:db_client/db_client.dart';
import 'package:engine/provider/hyperdrive_env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_client.g.dart';

@riverpod
Future<DbClient> dbClient(Ref ref, HyperdriveType type) async {
  final db = ref.watch(
    hyperdriveEnvProvider.select(
      (v) => switch (type) {
        HyperdriveType.cache => v.cache,
        HyperdriveType.noCache => v.noCache,
      },
    ),
  );
  await db.connect();
  ref.keepAlive();
  return DbClient(db: db);
}

enum HyperdriveType { cache, noCache }
