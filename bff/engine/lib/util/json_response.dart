import 'dart:convert';
import 'dart:io';

import 'package:engine/util/exception_handler.dart';
import 'package:shelf/shelf.dart';

Future<Response> jsonResponse(
  Future<Map<String, dynamic>> Function() fn,
) async => exceptionHandler(() async {
  final result = await fn();
  return Response.ok(
    jsonEncode(result),
    headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
  );
});
