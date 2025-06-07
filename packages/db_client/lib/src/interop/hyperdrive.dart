import 'dart:convert';

import 'package:db_client/src/interop/pg_result.dart';
import 'package:js_interop_utils/js_interop_utils.dart';

class HyperdriveEnv {
  const HyperdriveEnv({required this.cache, required this.noCache});

  final HyperdrivePg cache;
  final HyperdrivePg noCache;
}

extension type HyperdriveJsInterop._(JSObject _) implements JSObject {
  @JS('cache')
  external HyperdriveJsPg get cache;

  @JS('noCache')
  external HyperdriveJsPg get noCache;

  HyperdriveEnv get toDart =>
      HyperdriveEnv(cache: cache.toDart, noCache: noCache.toDart);
}

/// `bff/bridge/src/hyperdrive_pg.ts`のHyperdrivePgに対応するクラス
class HyperdrivePg {
  HyperdrivePg({
    required this.connect,
    required this.query,
    required this.close,
  });

  final Future<void> Function() connect;
  final Future<PgResult> Function({required String query, List<Object>? values})
  query;
  final Future<void> Function() close;
}

// `bff/bridge/src/hyperdrive_pg.ts`のHyperdrivePgに対応するクラス
extension type HyperdriveJsPg._(JSObject _) implements JSObject {
  @JS('connect')
  external JSPromise<JSObject> _connect();

  @JS('query')
  external JSPromise<PgResultJs> _query(
    JSString query,
    JSArray<JSAny?>? values,
  );

  @JS('close')
  // ignore: prefer_void_to_null
  external JSPromise<Null> _close();

  HyperdrivePg get toDart => HyperdrivePg(
    connect: () async => _connect().toDart,
    query: ({required query, values}) async {
      final resultJs =
          await _query(
            query.toJS,
            values?.map((e) => e.toJSDeep).toList().toJS,
          ).toDart;
      return resultJs.toDart;
    },
    close: () async => _close().toDart,
  );
}

extension type PgResultJs._(JSObject _) implements JSObject {
  PgResult get toDart => switch (type.toDart) {
    'success' => PgResultSuccess(
      value:
          (jsonDecode(value.toDart) as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
    ),
    'error' => PgResultError(
      error: jsonDecode(error.toDart) as Map<String, dynamic>,
    ),
    _ => throw UnimplementedError('Unknown PgResult: $type'),
  };

  @JS('type')
  external JSString get type;

  @JS('value')
  external JSString get value;

  @JS('error')
  external JSString get error;
}
