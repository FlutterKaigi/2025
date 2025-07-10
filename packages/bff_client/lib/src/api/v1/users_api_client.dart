import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api_client.g.dart';

@RestApi()
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio, {String baseUrl}) = _UsersApiClient;

  /// ユーザ情報を取得します
  /// Authorization Headerが必須
  @GET('/users/me')
  Future<HttpResponse<UserAndUserRoles>> getUserMe();

  /// ユーザ一覧を取得します
  /// Authorization Headerが必須（管理者権限が必要）
  @POST('/users/list')
  Future<HttpResponse<UsersListResponse>> getUserList({
    @Body() required UsersListRequest request,
  });

  /// 特定のユーザを取得します
  /// Authorization Headerが必須（管理者権限が必要）
  @GET('/users/{userId}')
  Future<HttpResponse<UserAndUserRoles>> getUser({
    @Path() required String userId,
  });

  /// ユーザのロールを更新します
  /// Authorization Headerが必須（管理者権限が必要）
  @PUT('/users/{userId}/roles')
  Future<HttpResponse<void>> putUserRoles({
    @Path() required String userId,
    @Body() required UserRolePutRequest request,
  });

  /// ユーザを論理削除します
  /// Authorization Headerが必須（管理者権限が必要）
  @DELETE('/users/{userId}')
  Future<HttpResponse<Map<String, dynamic>>> deleteUser({
    @Path() required String userId,
  });

  /// 削除済みユーザを復元します
  /// Authorization Headerが必須（管理者権限が必要）
  @POST('/users/{userId}/restore')
  Future<HttpResponse<Map<String, dynamic>>> restoreUser({
    @Path() required String userId,
  });

  /// 削除済みユーザーの一覧を取得します
  /// Authorization Headerが必須（管理者権限が必要）
  @GET('/users/deleted')
  Future<HttpResponse<UsersListResponse>> getDeletedUsers({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  /// ユーザの統計情報を取得します
  /// Authorization Headerが必須（管理者権限が必要）
  @GET('/users/stats')
  Future<HttpResponse<Map<String, dynamic>>> getUserStats();
}
