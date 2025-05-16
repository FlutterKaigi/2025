import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:engine/util/exception_handler.dart';
import 'package:shelf/shelf.dart';

Future<Response> jsonResponse(
  Future<Map<String, dynamic>> Function() fn, [
  int statusCode = HttpStatus.ok,
]) async => exceptionHandler(() async {
  final result = await fn();
  return Response(
    statusCode,
    body: jsonEncode(result),
    encoding: Encoding.getByName('utf-8'),
    headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
  );
});
