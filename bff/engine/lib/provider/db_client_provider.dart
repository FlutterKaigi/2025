import 'dart:async';
import 'dart:developer';

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

  // 30秒おきにping
  final timer = Timer.periodic(
    const Duration(seconds: 30),
    (timer) async {
      try {
        await db.ping.ping();
      } on Exception catch (e) {
        log(e.toString());
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
