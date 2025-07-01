import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
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
    final supabaseUserResult = await _supabaseUtil.extractSupabaseUser(request);
    final supabaseUser =
        supabaseUserResult.unwrap; // AuthorizationExceptionの場合はthrowされる
    final db = await container.read(
      dbClientProvider(HyperdriveType.noCache).future,
    );
    final result = await db.user.getUserAndUserRoles(supabaseUser.id);
    return result.toJson();
  });

  @Route.get('/list')
  Future<Response> _getUserList(Request request) async => jsonResponse(
    () async {
      final result = await _supabaseUtil.extractUser(request);
      final (_, user, roles) =
          result.unwrap; // AuthorizationExceptionの場合はthrowされる
      if (!roles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.unauthorized,
          detail: 'You are not authorized to access this resource',
        );
      }
      final bodyString = await request.readAsString();
      final body = jsonDecode(bodyString) as Map<String, dynamic>;
      final requestData = UsersListRequest.fromJson(body);
      final db = await container.read(
        dbClientProvider(HyperdriveType.cache).future,
      );
      final userLists = await db.user.getUserList(
        email: requestData.email,
        roles: requestData.roles,
        limit: requestData.limit,
        offset: requestData.offset,
      );
      final response = UsersListResponse(users: userLists);
      return response.toJson();
    },
  );

  @Route.get('/<userId>')
  Future<Response> _getUser(Request request, String userId) async =>
      jsonResponse(() async {
        final result = await _supabaseUtil.extractUser(request);
        final (_, user, roles) =
            result.unwrap; // AuthorizationExceptionの場合はthrowされる
        // 管理者か、自分のユーザー情報を取得する場合以外はUnauthorized
        if (!roles.contains(Role.admin) || user.id != userId) {
          throw ErrorResponse.errorCode(
            code: ErrorCode.unauthorized,
            detail: 'You are not authorized to access this resource',
          );
        }

        final db = await container.read(
          dbClientProvider(HyperdriveType.noCache).future,
        );
        final matchedUser = await db.user.getUserAndUserRoles(userId);
        return matchedUser.toJson();
      });

  @Route.put('/<userId>/roles')
  Future<Response> _putUserRoles(Request request, String userId) async =>
      exceptionHandler(
        () async {
          final result = await _supabaseUtil.extractUser(request);
          final (_, user, roles) =
              result.unwrap; // AuthorizationExceptionの場合はthrowされる

          // 管理者以外はUnauthorized
          if (!roles.contains(Role.admin)) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.unauthorized,
              detail: 'You are not authorized to access this resource',
            );
          }

          final bodyString = await request.readAsString();
          final body = jsonDecode(bodyString) as Map<String, dynamic>;
          final requestData = UserRolePutRequest.fromJson(body);
          final db = await container.read(
            dbClientProvider(HyperdriveType.noCache).future,
          );
          await db.user.updateUserRoles(userId, requestData.roles);

          return Response(HttpStatus.noContent);
        },
      );

  Router get router => _$UserApiRouteRouter(this);
}
