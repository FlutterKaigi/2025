import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:riverpod/riverpod.dart';
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
    final response = UserMeGetResponse(user: user);
    return response.toJson();
  });

  @Route.get('/list')
  Future<Response> _listUsers(Request request) async => jsonResponse(() async {
    // 1. Authentication and Authorization
    final userRecordResult = await _supabaseUtil.extractUser(request);
    // jsonResponse should handle AuthorizationException if unwrap fails
    final userRecord = userRecordResult.unwrap;

    if (!SupabaseUtil.isAdmin(userRecord)) {
      return Response.forbidden(
        '{"error": "User is not authorized to access this resource."}',
        headers: {'Content-Type': 'application/json'},
      );
    }

    // 2. Parse Pagination Parameters
    final queryParams = request.url.queryParameters;
    // 2. Parse Pagination Parameters
    final queryParams = request.url.queryParameters;
    int page;
    int pageSize;

    final String? pageStr = queryParams['page'];
    final String? pageSizeStr = queryParams['pageSize'];

    if (pageStr != null && int.tryParse(pageStr) == null) {
      return Response.badRequest(
        body: '{"error": "\'page\' parameter must be a valid integer."}',
        headers: {'Content-Type': 'application/json'},
      );
    }
    if (pageSizeStr != null && int.tryParse(pageSizeStr) == null) {
      return Response.badRequest(
        body: '{"error": "\'pageSize\' parameter must be a valid integer."}',
        headers: {'Content-Type': 'application/json'},
      );
    }

    page = int.tryParse(pageStr ?? '1') ?? 1; // Default to 1 if null or parsing failed (though caught above)
    pageSize = int.tryParse(pageSizeStr ?? '10') ?? 10; // Default to 10

    if (page <= 0) {
       return Response.badRequest(
        body: '{"error": "\'page\' must be a positive integer."}',
        headers: {'Content-Type': 'application/json'},
      );
    }
    if (pageSize <= 0) {
       return Response.badRequest(
        body: '{"error": "\'pageSize\' must be a positive integer."}',
        headers: {'Content-Type': 'application/json'},
      );
    }
    
    const int maxPageSize = 100;
    if (pageSize > maxPageSize) {
      // Optionally, could also return a bad request here:
      // return Response.badRequest(
      //   body: '{"error": "\'pageSize\' cannot exceed $maxPageSize."}',
      //   headers: {'Content-Type': 'application/json'},
      // );
      pageSize = maxPageSize; // Current behavior: cap it
    }

    // 3. Fetch User List
    final userListData = await _supabaseUtil.getUsersList(page: page, pageSize: pageSize);

    // 4. Construct API Response
    final apiResponse = UserListResponse(
      users: userListData.users,
      totalCount: userListData.totalCount,
      page: page,
      pageSize: pageSize,
    );
    return apiResponse.toJson();
  });

  Router get router => _$UserApiRouteRouter(this);
}
