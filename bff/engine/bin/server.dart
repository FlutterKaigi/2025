import 'dart:typed_data';

import 'package:engine/cf_workers_interop.dart';
import 'package:engine/extension/request_shelf_converter.dart';
import 'package:engine/provider/handler.dart';
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:riverpod/riverpod.dart';
import 'package:web/web.dart' as web;

late ProviderContainer container;

Future<void> main() async {
  final cfDartWorkers = getCfDartWorkers();
  final request = cfDartWorkers.request;

  try {
    container = ProviderContainer();

    final handler = container.read(handlerProvider);
    final response = await handler(request.toShelf);

    final bytes = await response.read().fold<List<int>>(
      [],
      (previousValue, element) => [...previousValue, ...element],
    );

    final jsResponse = web.Response(
      Uint8List.fromList(bytes).buffer.toJS,
      web.ResponseInit(
        headers: response.headers.toJSDeep,
        status: response.statusCode,
      ),
    );

    cfDartWorkers.response(jsResponse);
  } catch (e) {
    print("Error: $e");
  }
}
