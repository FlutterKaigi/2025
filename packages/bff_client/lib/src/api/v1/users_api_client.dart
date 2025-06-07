import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api_client.g.dart';

@RestApi()
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio, {String baseUrl}) = _UsersApiClient;

  /// ユーザ情報を取得します
  /// Authorization Headerが必須
  @GET('/users/me')
  Future<HttpResponse<UserGetResponse>> getUserMe();
}
