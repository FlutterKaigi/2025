import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'user_api_service.g.dart';

@Riverpod(keepAlive: true)
UserApiService userApiService(Ref ref) =>
    UserApiService(supabaseUtil: ref.watch(supabaseUtilProvider));

class UserApiService {
  UserApiService({required SupabaseUtil supabaseUtil})
    : _supabaseUtil = supabaseUtil;

  final SupabaseUtil _supabaseUtil;

  @Route.get('/me')
  Future<Response> _getMe(Request request) async {
    final result = await _supabaseUtil.extractUser(request);
    print(result);
    final (_, user) = result.unwrap;
    final response = UserMeGetResponse(user: user);
    return Response.ok(
      response.toJson(),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }

  Router get router => _$UserApiServiceRouter(this);
}
