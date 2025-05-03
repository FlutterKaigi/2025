import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:web/web.dart' as web;

extension RequestShelfConverter on web.Request {
  shelf.Request get toShelf {
    final uri = Uri.parse(url);
    return shelf.Request(
      method,
      uri,
      headers: headers.toMap().cast<String, Object>(),
      body: _bodyStream(),
    );
  }

  // See: https://github.com/dart-lang/http/blob/29c5733014d8cc485a6b11b24c5b11ba172cb686/pkgs/http/lib/src/browser_client.dart#L143
  Stream<List<int>> _bodyStream() async* {
    final bodyStreamReader =
        body?.getReader() as web.ReadableStreamDefaultReader?;
    if (bodyStreamReader == null) {
      return;
    }

    while (true) {
      final chunk = await bodyStreamReader.read().toDart;
      if (chunk.done) {
        break;
      }
      yield (chunk.value! as JSUint8Array).toDart;
    }
  }
}
