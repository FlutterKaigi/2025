import 'package:engine/model/cf_workers_interop/cf_workers_env.dart';
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:web/web.dart' as web;

/// JS側から、リクエストに関する情報等を受け取るための関数
@JS('__dart_cf_workers')
external CfDartWorkers getCfDartWorkers();

extension type CfDartWorkers._(JSObject _) implements JSObject {
  external factory CfDartWorkers();

  external web.Request request;
  external CfWorkersJsEnv env;
  external JSExecutionContext ctx;

  /// Dart側でのリクエストハンドリングが完了したら、レスポンスをこの関数を通じてJS側に渡す
  external void response(web.Response response);
  external JSPromise<web.Response> fetch(
    web.RequestInfo request, [
    web.RequestInit? requestInit,
  ]);
}

extension type JSExecutionContext._(JSObject _) implements JSObject {
  @JS('waitUntil')
  external void waitUntil(JSPromise<JSAny?> promise);

  @JS('passThroughOnException')
  external void passThroughOnException();
}

extension JSExecutionContextToDart on JSExecutionContext {
  ExecutionContext get toDart => ExecutionContext._(this);
}

class ExecutionContext {
  ExecutionContext._(this._ctx);

  final JSExecutionContext _ctx;

  void waitUntil(JSPromise<JSAny?> promise) => _ctx.waitUntil(promise);

  void passThroughOnException() => _ctx.passThroughOnException();

  JSExecutionContext get toJs => _ctx;
}
