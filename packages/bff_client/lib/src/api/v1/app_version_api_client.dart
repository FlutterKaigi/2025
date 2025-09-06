import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_version_api_client.g.dart';

@RestApi()
abstract class AppVersionApiClient {
  factory AppVersionApiClient(Dio dio, {String baseUrl}) = _AppVersionApiClient;

  /// アプリのバージョン情報を取得します
  @GET('/app/version')
  Future<HttpResponse<AppVersionResponse>> checkVersion();
}