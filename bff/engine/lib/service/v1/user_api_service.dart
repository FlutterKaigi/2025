import 'dart:convert';

import 'package:engine/provider/supabase_client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:supabase/supabase.dart';

part 'user_api_service.g.dart';

@Riverpod(keepAlive: true)
UserApiService userApiService(Ref ref) =>
    UserApiService(supabaseClient: ref.watch(supabaseClientProvider));

class UserApiService {
  UserApiService({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @Route.get('/me')
  Future<Response> _getMe(Request request) async {
    // 疎通確認
    final results =
        await _supabaseClient
            .from('users')
            .select()
            .eq('id', '-1')
            .maybeSingle();
    return Response.ok(jsonEncode(results));
  }

  Router get router => _$UserApiServiceRouter(this);
}
