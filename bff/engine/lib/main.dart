import 'dart:typed_data';

import 'package:engine/extension/request_shelf_converter.dart';
import 'package:engine/model/cf_workers_interop/cf_workers_env.dart';
import 'package:engine/model/cf_workers_interop/cf_workers_interop.dart';
import 'package:engine/provider/cf_workers_env.dart';
import 'package:engine/provider/handler.dart';
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:riverpod/riverpod.dart';
import 'package:web/web.dart' as web;

late ProviderContainer container;

Future<void> main() async {
  final cfDartWorkers = getCfDartWorkers();
  final cfWorkersEnv = cfDartWorkers.env.toDart;
  final request = cfDartWorkers.request;

  try {
    container = ProviderContainer(
      overrides: [cfWorkersEnvProvider.overrideWithValue(cfWorkersEnv)],
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
  } on Exception catch (e) {
    print('Error: $e');
  }
}
