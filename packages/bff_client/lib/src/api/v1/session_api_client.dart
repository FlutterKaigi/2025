import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'session_api_client.g.dart';

@RestApi()
abstract class SessionApiClient {
  factory SessionApiClient(Dio dio, {String baseUrl}) = _SessionApiClient;

  /// 全セッション一覧を取得
  @GET('/sessions')
  Future<HttpResponse<SessionListResponse>> getAllSessions();

  /// 会場別セッション一覧を取得（スピーカー、スポンサー情報含む）
  @GET('/sessions/venues')
  Future<HttpResponse<SessionWithVenueResponse>> getSessionsByVenue();

  /// スポンサーセッション一覧を取得
  @GET('/sessions/sponsors')
  Future<HttpResponse<SponsorSessionResponse>> getSponsorSessions();

  /// タイムテーブル形式でセッション一覧を取得
  @GET('/sessions/schedule')
  Future<HttpResponse<SessionScheduleResponse>> getSessionSchedule();

  /// 特定セッションの詳細を取得
  @GET('/sessions/{id}')
  Future<HttpResponse<SessionDetailResponse>> getSessionById({
    @Path() required String id,
  });
}
