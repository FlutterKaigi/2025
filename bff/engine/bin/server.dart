import 'dart:convert';
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

    // Content-Typeをチェックしてテキストかバイナリかを判断
    final contentType = response.headers['content-type'] ?? '';
    final isTextContent = _isTextContentType(contentType);

    // テキストの場合はString、それ以外はArrayBufferとして渡す
    final jsResponse =
        isTextContent
            ? web.Response(
              utf8.decode(bytes).toJS,
              web.ResponseInit(
                headers: response.headers.toJSDeep,
                status: response.statusCode,
              ),
            )
            : web.Response(
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

// テキストベースのContent-Typeかどうかを判定
bool _isTextContentType(String contentType) {
  final lowerCase = contentType.toLowerCase();
  return lowerCase.contains('text/') ||
      lowerCase.contains('application/json') ||
      lowerCase.contains('application/xml') ||
      lowerCase.contains('application/javascript') ||
      lowerCase.contains('+json') ||
      lowerCase.contains('+xml');
}
