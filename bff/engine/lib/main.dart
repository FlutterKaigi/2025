import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bff_client/bff_client.dart';
import 'package:engine/extension/request_shelf_converter.dart';
import 'package:engine/model/cf_workers_interop/cf_workers_env.dart';
import 'package:engine/model/cf_workers_interop/cf_workers_interop.dart';
import 'package:engine/provider/cf_workers_env.dart';
import 'package:engine/provider/fetch_api_http_client.dart';
import 'package:engine/provider/handler.dart';
import 'package:engine/provider/hyperdrive_env.dart';
import 'package:engine/util/fetch_http_client.dart';
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:riverpod/riverpod.dart';
import 'package:web/web.dart' as web;

late ProviderContainer container;

Future<void> main() async {
  try {
    final cfDartWorkers = getCfDartWorkers();
    final cfWorkersEnv = cfDartWorkers.env;
    final request = cfDartWorkers.request;

    container = ProviderContainer(
      overrides: [
        cfWorkersEnvProvider.overrideWithValue(cfWorkersEnv.toDart),
        fetchApiHttpClientProvider.overrideWithValue(
          FetchApiHttpClient(
            fetch:
                // MEMO(YumNumm): Extension Typeを使った型は引数を明示的に書く必要がある
                // ignore: unnecessary_lambdas
                (requestInfo, [requestInit]) =>
                    cfDartWorkers.fetch(requestInfo, requestInit),
          ),
        ),
        hyperdriveEnvProvider.overrideWithValue(
          cfDartWorkers.hyperdrive.toDart,
        ),
      ],
    );

    final handler = container.read(handlerProvider);
    final response = await handler(request.toShelf);

    final bytes = await response.read().fold<List<int>>(
      [],
      (previousValue, element) => [...previousValue, ...element],
    );

    final jsResponse = web.Response(
      Uint8List.fromList(bytes).buffer.toJS,
      web.ResponseInit(
        headers:
            {
              ...response.headers,
              'x-commit-hash': cfWorkersEnv.commitHash,
            }.toJSDeep,
        status: response.statusCode,
      ),
    );

    cfDartWorkers.response(jsResponse);
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    print(e);
    if (e is StateError) {
      print(e.message);
      print(e.stackTrace);
    }
    final cfDartWorkers = getCfDartWorkers();

    cfDartWorkers.response(
      web.Response(
        jsonEncode(
          ErrorResponse.errorCode(
            code: ErrorCode.internalServerError,
            detail: 'Unhandled Exception: ${e.runtimeType}',
          ),
        ).toJS,
        web.ResponseInit(
          status: 500,
          headers:
              {
                HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
              }.toJSDeep,
        ),
      ),
    );
    rethrow;
  }
}
