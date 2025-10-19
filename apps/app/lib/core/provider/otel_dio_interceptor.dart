import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutterrific_opentelemetry/flutterrific_opentelemetry.dart';
import 'package:uuid/uuid.dart';

class OTelDioInterceptor implements Interceptor {
  OTelDioInterceptor({Tracer? tracer}) : super() {
    _tracer = tracer ?? FlutterOTel.tracer;
  }

  late final Tracer _tracer;

  final HashMap<String, Span> _spans = HashMap<String, Span>();

  static const _requestIdHeader = 'x-request-id';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestId = const Uuid().v7();
    options.headers[_requestIdHeader] = requestId;
    final span = _tracer.startSpan(
      'Dio Request',
      attributes: Attributes.of({
        'http.method': options.method,
        'http.url': options.uri.toString(),
        'http.request_id': requestId,
        'http.request_headers': options.headers.toString(),
        'http.request_body': options.data.toString(),
        'http.request_body_type':
            options.data?.runtimeType.toString() ?? 'unknown',
      }),
    );
    _spans[requestId] = span;
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final requestId = response.headers.value(_requestIdHeader);
    final currentSpan = _spans.remove(requestId);
    if (currentSpan != null) {
      final status = response.statusCode;
      if (status != null) {
        currentSpan.setIntAttribute('http.status_code', status);
      }
      currentSpan.end();
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final requestId = err.requestOptions.headers[_requestIdHeader];
    final currentSpan = _spans.remove(requestId);
    if (currentSpan != null) {
      currentSpan.setIntAttribute(
        'http.status_code',
        err.response?.statusCode ?? 0,
      );
      currentSpan.end();
    }
    handler.next(err);
  }
}
