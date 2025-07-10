import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'user_api_service.g.dart';

class UserApiService {
  @Route.get('/users/me')
  Future<Response> _getUserMe(Request request) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (supabaseUser, user, roles) = userResult.unwrap;

          return UserAndUserRoles(
            user: user,
            roles: roles,
            authMetaData: AuthMetaData(
              email: supabaseUser.email ?? '',
              avatarUrl: supabaseUser.userMetadata?['avatar_url'] ?? '',
              name: supabaseUser.userMetadata?['name'] ?? '',
            ),
          ).toJson();
        },
      );

  @Route.post('/users/list')
  Future<Response> _getUserList(Request request) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          userResult.unwrap; // 認証チェック

          final body = await request.readAsString();
          final requestData = UsersListRequest.fromJson(
            jsonDecode(body) as Map<String, dynamic>,
          );

          final database = await container.read(dbClientProvider.future);
          final users = await database.user.getUserList(
            email: requestData.email,
            roles: requestData.roles,
            limit: requestData.limit,
            offset: requestData.offset,
          );

          return UsersListResponse(users: users).toJson();
        },
      );

  @Route.get('/users/<userId>')
  Future<Response> _getUser(Request request, String userId) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          userResult.unwrap; // 認証チェック

          final database = await container.read(dbClientProvider.future);
          final user = await database.user.getUserAndUserRoles(userId);

          return user.toJson();
        },
      );

  @Route.put('/users/<userId>/roles')
  Future<Response> _putUserRoles(Request request, String userId) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          userResult.unwrap; // 認証チェック

          final body = await request.readAsString();
          final requestData = UserRolePutRequest.fromJson(
            jsonDecode(body) as Map<String, dynamic>,
          );

          final database = await container.read(dbClientProvider.future);
          await database.user.updateUserRoles(userId, requestData.roles);

          return <String, dynamic>{
            'success': true,
          };
        },
      );

  /// ユーザを削除します
  @Route.delete('/users/<userId>')
  Future<Response> _deleteUser(Request request, String userId) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, currentUser, currentRoles) = userResult.unwrap;

          // 管理者権限チェック
          if (!currentRoles.contains(Role.admin)) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.forbidden,
              detail: 'この操作には管理者権限が必要です',
            );
          }

          // 自分自身を削除することはできない
          if (currentUser.id == userId) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.badRequest,
              detail: '自分自身を削除することはできません',
            );
          }

          final database = await container.read(dbClientProvider.future);
          await database.user.deleteUser(userId);

          return <String, dynamic>{
            'success': true,
          };
        },
      );

  /// ユーザーの統計情報を取得します
  @Route.get('/users/stats')
  Future<Response> _getUserStats(Request request) async => jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, _, roles) = userResult.unwrap;

          // 管理者権限チェック
          if (!roles.contains(Role.admin)) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.forbidden,
              detail: 'この操作には管理者権限が必要です',
            );
          }

          final database = await container.read(dbClientProvider.future);
          final stats = await database.user.getUserStats();

          return stats;
        },
      );

  Handler get handler => _$UserApiServiceRouter(this).call;
}
