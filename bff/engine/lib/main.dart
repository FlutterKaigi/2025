import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:supabase/supabase.dart';

// Riverpod providers
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  final supabaseUrl = ArgumentError.checkNotNull(
    Platform.environment['SUPABASE_URL'],
  );
  final supabaseServiceRoleKey = ArgumentError.checkNotNull(
    Platform.environment['SUPABASE_SERVICE_ROLE_KEY'],
  );

  return SupabaseClient(
    supabaseUrl,
    supabaseServiceRoleKey,
    httpClient: http.Client(),
  );
});

final supabaseUtilProvider = Provider<SupabaseUtil>((ref) {
  return SupabaseUtil(supabaseClient: ref.watch(supabaseClientProvider));
});

// Removed containerProvider as it's not used directly

// Middlewares
Middleware providerMiddleware(ProviderContainer container) {
  return (Handler handler) {
    return (Request request) async {
      final newRequest = request.change(
        context: {
          'container': container,
          'supabaseUtil': container.read(supabaseUtilProvider),
        },
      );
      return await handler(newRequest);
    };
  };
}

// Health check route
Response healthCheck(Request request) {
  return Response.ok(
    '{"status": "ok"}',
    headers: {'Content-Type': 'application/json'},
  );
}

// User me route
Future<Response> userMe(Request request) async {
  if (request.method != 'GET') {
    return Response(HttpStatus.methodNotAllowed);
  }

  return exceptionHandler(() async {
    final supabaseUtil = request.context['supabaseUtil']! as SupabaseUtil;
    final result = await supabaseUtil.extractUser(request);
    final (_, user) = result.unwrap; // AuthorizationExceptionの場合はthrowされる
    final response = UserMeGetResponse(user: user);

    return Response.ok(
      jsonEncode(response.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  });
}

// Router setup
Router createRouter() {
  final router = Router();

  // Health check
  router.get('/health', healthCheck);

  // V1 API routes
  router.get('/v1/users/me', userMe);

  return router;
}

Future<void> main() async {
  print('Starting server...');
  print('SUPABASE_URL: ${Platform.environment['SUPABASE_URL']}');
  print(
    'SUPABASE_SERVICE_ROLE_KEY: ${Platform.environment['SUPABASE_SERVICE_ROLE_KEY']?.substring(0, 5)}...',
  );
  print('PORT: ${Platform.environment['PORT']}');

  // Create provider container
  final container = ProviderContainer();

  // Create router
  final router = createRouter();

  // Create handler with middleware
  final handler = const Pipeline()
      .addMiddleware(providerMiddleware(container))
      .addHandler(router.call);

  // Get port from environment or use default
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // Start server
  final server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4,
    port,
  );

  print('Server listening on port ${server.port}');
}
