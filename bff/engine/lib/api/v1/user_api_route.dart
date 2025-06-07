import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'user_api_route.g.dart';

@Riverpod(keepAlive: true)
UserApiRoute userApiRoute(Ref ref) =>
    UserApiRoute(supabaseUtil: ref.watch(supabaseUtilProvider));

class UserApiRoute {
  UserApiRoute({required SupabaseUtil supabaseUtil})
    : _supabaseUtil = supabaseUtil;

  final SupabaseUtil _supabaseUtil;

  @Route.get('/me')
  Future<Response> _getMe(Request request) async => jsonResponse(() async {
    final result = await _supabaseUtil.extractUser(request);
    final (_, user) = result.unwrap; // AuthorizationExceptionの場合はthrowされる
    final response = UserGetResponse(user: user);
    return response.toJson();
  });

  Router get router => _$UserApiRouteRouter(this);
}
