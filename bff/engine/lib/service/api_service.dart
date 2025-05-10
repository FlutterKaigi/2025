import 'dart:convert';

import 'package:engine/main.dart';
import 'package:engine/provider/cf_workers_env.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) => ApiService();

class ApiService {
  @Route.get('/')
  Future<Response> _getIndex(Request request) async {
    return Response.ok(
      jsonEncode({
        'message': 'Hello! I am FlutterKaigi 2025 BFF.',
        'requested_at': DateTime.now().toIso8601String(),
        'request_headers': request.headers,
        'request_url': request.requestedUri.toString(),
      }),
    );
  }

  @Route.get('/env')
  Future<Response> _getSupabaseConnectionInfo(Request request) async {
    final cfWorkersEnv = container.read(cfWorkersEnvProvider);
    return Response.ok(
      jsonEncode({
        'SUPABASE_URL': cfWorkersEnv.supabaseUrl,
        'SUPABASE_SERVICE_ROLE_KEY.length':
            cfWorkersEnv.supabaseServiceRoleKey.length,
        'COMMIT_HASH': cfWorkersEnv.commitHash,
      }),
    );
  }

  Router get router => _$ApiServiceRouter(this);
}
