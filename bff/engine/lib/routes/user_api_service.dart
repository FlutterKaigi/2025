import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'user_api_service.g.dart';

class UserApiService {
  @Route.get('/me')
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
          avatarUrl: supabaseUser.userMetadata?['avatar_url'] as String? ?? '',
          name: supabaseUser.userMetadata?['name'] as String? ?? '',
        ),
      ).toJson();
    },
  );

  @Route.get('/list')
  Future<Response> _getUserList(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, _, userRoles) = userResult.unwrap;

      // 管理者権限チェック
      if (!userRoles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'この操作には管理者権限が必要です',
        );
      }

      // クエリパラメータから検索条件を取得
      final limit =
          int.tryParse(request.url.queryParameters['limit'] ?? '10') ?? 10;
      final offset =
          int.tryParse(request.url.queryParameters['offset'] ?? '0') ?? 0;
      final email = request.url.queryParameters['email'];
      final rolesParam = request.url.queryParameters['roles'];

      List<Role>? filterRoles;
      if (rolesParam != null && rolesParam.isNotEmpty) {
        filterRoles = rolesParam
            .split(',')
            .map((e) => e.trim())
            .where(
              (roleName) => Role.values.any((role) => role.name == roleName),
            )
            .map(
              (roleName) =>
                  Role.values.firstWhere((role) => role.name == roleName),
            )
            .toList();

        // 有効なロールが見つからない場合は null にする
        if (filterRoles.isEmpty) {
          filterRoles = null;
        }
      }

      final database = await container.read(dbClientProvider.future);
      final users = await database.user.getUserList(
        email: email,
        roles: filterRoles,
        limit: limit,
        offset: offset,
      );

      return UsersListResponse(users: users).toJson();
    },
  );

  @Route.get('/<userId>')
  Future<Response> _getUser(Request request, String userId) async =>
      jsonResponse(
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
          final user = await database.user.getUserAndUserRoles(userId);

          return user.toJson();
        },
      );

  @Route.put('/<userId>/roles')
  Future<Response> _putUserRoles(Request request, String userId) async =>
      jsonResponse(
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

  /// ユーザを論理削除します
  @Route.delete('/<userId>')
  Future<Response> _deleteUser(Request request, String userId) async =>
      jsonResponse(
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
            'message': 'ユーザーが論理削除されました',
          };
        },
      );

  /// ユーザーを復元します
  @Route.post('/<userId>/restore')
  Future<Response> _restoreUser(Request request, String userId) async =>
      exceptionHandler(
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
          await database.user.restoreUser(userId);

          return Response(
            HttpStatus.noContent,
          );
        },
      );

  Router get router => _$UserApiServiceRouter(this);
}
