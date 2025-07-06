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
  /// Authorization Headerが必須
  @GET('/users/list')
  Future<HttpResponse<UsersListResponse>> getUserList({
    @Body() required UsersListRequest request,
  });

  @GET('/users/{userId}')
  Future<HttpResponse<UserAndUserRoles>> getUser({
    @Path() required String userId,
  });

  @PUT('/users/{userId}/roles')
  Future<HttpResponse<void>> putUserRoles({
    @Path() required String userId,
    @Body() required UserRolePutRequest request,
  });
}
