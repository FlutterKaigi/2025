import 'dart:async';

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
    logoBaseUrl: env.logoBaseUrl,
    disableSsl: env.isLocal,
  );

  // 1秒おきにデータベースが接続できているか確認
  final timer = Timer.periodic(
    const Duration(seconds: 1),
    (timer) async {
      if (!db.isOpen) {
        ref.invalidateSelf();
      }
    },
  );

  ref.onDispose(() async {
    timer.cancel();
    await db.dispose();
  });

  return db;
}
