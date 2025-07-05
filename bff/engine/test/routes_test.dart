import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/test.dart';

void main() {
  group('Routes', () {
    late Router router;
    
    setUp(() {
      router = Router();
      
      // Health check route
      router.get('/health', (Request request) {
        return Response.ok(
          '{"status": "ok"}',
          headers: {'Content-Type': 'application/json'},
        );
      });
    });

    group('GET /health', () {
      test('responds with 200 and health status', () async {
        final request = Request('GET', Uri.parse('http://example.com/health'));
        final response = await router.call(request);
        
        expect(response.statusCode, equals(200));
        expect(
          response.headers['Content-Type'],
          equals('application/json'),
        );
        
        final body = await response.readAsString();
        expect(body, equals('{"status": "ok"}'));
      });
    });
  });
}
