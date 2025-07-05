import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:test/test.dart';

import '../routes/index.dart' as index_route;
import '../routes/health.dart' as health_route;

void main() {
  group('Routes Tests', () {
    test('index route returns correct response', () {
      final context = _createMockContext();
      final response = index_route.onRequest(context);
      
      expect(response.statusCode, equals(200));
    });

    test('health route returns correct response', () {
      final context = _createMockContext();
      final response = health_route.onRequest(context);
      
      expect(response.statusCode, equals(200));
    });

    test('index route returns JSON with message', () async {
      final context = _createMockContext();
      final response = index_route.onRequest(context);
      
      expect(response.headers['content-type'], contains('application/json'));
      
      final body = await response.body();
      expect(body, contains('FlutterKaigi 2025 BFF'));
    });

    test('health route returns status ok', () async {
      final context = _createMockContext();
      final response = health_route.onRequest(context);
      
      expect(response.headers['content-type'], contains('application/json'));
      
      final body = await response.body();
      expect(body, contains('ok'));
    });
  });
}

RequestContext _createMockContext() {
  final request = Request.get(Uri.parse('http://localhost:8080/'));
  return RequestContext(
    request: request,
    mounted: {},
  );
}
