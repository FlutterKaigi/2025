import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:web/web.dart' as web;

@JS('__dart_cf_workers')
external CfDartWorkers getCfDartWorkers();

extension type CfDartWorkers._(JSObject _) implements JSObject {
  external factory CfDartWorkers();

  external web.Request request;
  external JSObject env;
  external JSExecutionContext ctx;
  external void response(web.Response response);
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
