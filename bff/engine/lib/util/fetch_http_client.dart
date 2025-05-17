// `https://github.com/dart-lang/http/blob/e70a41b8b841ada9ba124b3b9e1a4d3c525b8bf9/pkgs/http/lib/src/browser_client.dart`から一部編集

// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:js_interop';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:web/web.dart' as web;
import 'package:web/web.dart';

/// A `package:web`-based HTTP client that runs in the browser and is backed by
/// [`window.fetch`](https://fetch.spec.whatwg.org/).
///
/// This client inherits some limitations of `window.fetch`:
///
/// - [http.BaseRequest.persistentConnection] is ignored;
/// - Setting [http.BaseRequest.followRedirects] to `false` will cause
///   [http.ClientException] when a redirect is encountered;
/// - The value of [http.BaseRequest.maxRedirects] is ignored.
///
/// Responses are streamed but requests are not. A request will only be sent
/// once all the data is available.
class FetchApiHttpClient extends BaseClient {
  FetchApiHttpClient({required this.fetch});

  final JSPromise<web.Response> Function(
    web.RequestInfo input, [
    web.RequestInit? init,
  ])
  fetch;

  final _abortController = AbortController();

  /// Whether to send credentials such as cookies or authorization headers for
  /// cross-site requests.
  ///
  /// Defaults to `false`.
  bool withCredentials = false;

  bool _isClosed = false;

  /// Sends an HTTP request and asynchronously returns the response.
  @override
  Future<http.StreamedResponse> send(BaseRequest request) async {
    if (_isClosed) {
      throw ClientException(
        'HTTP request failed. Client is already closed.',
        request.url,
      );
    }

    final bodyBytes = await request.finalize().toBytes();
    try {
      final response =
          await fetch(
            web.Request(
              '${request.url}'.toJS,
              RequestInit(
                method: request.method,
                body: bodyBytes.isNotEmpty ? bodyBytes.toJS : null,
                credentials: withCredentials ? 'include' : 'same-origin',
                headers:
                    {
                          if (request.contentLength case final contentLength?)
                            'content-length': contentLength,
                          for (final header in request.headers.entries)
                            header.key: header.value,
                        }.jsify()!
                        as HeadersInit,
                signal: _abortController.signal,
                redirect: request.followRedirects ? 'follow' : 'error',
              ),
            ),
          ).toDart;

      final contentLengthHeader = response.headers.get('content-length');

      final contentLength =
          contentLengthHeader != null
              ? int.tryParse(contentLengthHeader)
              : null;

      if (contentLength == null && contentLengthHeader != null) {
        throw ClientException(
          'Invalid content-length header [$contentLengthHeader].',
          request.url,
        );
      }

      final headers = <String, String>{};
      (response.headers as _IterableHeaders).forEach(
        (String value, String header, [JSAny? _]) {
          headers[header.toLowerCase()] = value;
        }.toJS,
      );

      return http.StreamedResponse(
        _readBody(request, response),
        response.status,
        headers: headers,
        request: request,
        contentLength: contentLength,
        reasonPhrase: response.statusText,
      );
    } catch (e, st) {
      _rethrowAsClientException(e, st, request);
    }
  }

  /// Closes the client.
  ///
  /// This terminates all active requests.
  @override
  void close() {
    _isClosed = true;
    _abortController.abort();
  }
}

Never _rethrowAsClientException(Object e, StackTrace st, BaseRequest request) {
  if (e is! ClientException) {
    var message = e.toString();
    if (message.startsWith('TypeError: ')) {
      message = message.substring('TypeError: '.length);
    }
    // ignore: parameter_assignments
    e = ClientException(message, request.url);
  }
  Error.throwWithStackTrace(e, st);
}

Stream<List<int>> _readBody(BaseRequest request, web.Response response) async* {
  final bodyStreamReader =
      response.body?.getReader() as ReadableStreamDefaultReader?;

  if (bodyStreamReader == null) {
    return;
  }

  var isDone = false;
  var isError = false;
  try {
    while (true) {
      final chunk = await bodyStreamReader.read().toDart;
      if (chunk.done) {
        isDone = true;
        break;
      }
      yield (chunk.value! as JSUint8Array).toDart;
    }
  } catch (e, st) {
    isError = true;
    _rethrowAsClientException(e, st, request);
  } finally {
    if (!isDone) {
      try {
        // catchError here is a temporary workaround for
        // http://dartbug.com/57046: an exception from cancel() will
        // clobber an exception which is currently in flight.
        await bodyStreamReader.cancel().toDart.catchError(
          (_) => null,
          test: (_) => isError,
        );
      } catch (e, st) {
        // If we have already encountered an error swallow the
        // error from cancel and simply let the original error to be
        // rethrown.
        if (!isError) {
          _rethrowAsClientException(e, st, request);
        }
      }
    }
  }
}

/// Workaround for `Headers` not providing a way to iterate the headers.
@JS()
extension type _IterableHeaders._(JSObject _) implements JSObject {
  external void forEach(JSFunction fn);
}
