import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'speaker_api_client.g.dart';

@RestApi()
abstract class SpeakerApiClient {
  factory SpeakerApiClient(Dio dio, {String baseUrl}) = _SpeakerApiClient;

  /// 全スピーカー一覧を取得
  @GET('/speakers')
  Future<HttpResponse<SpeakerListResponse>> getAllSpeakers();

  /// 特定スピーカーの詳細を取得
  @GET('/speakers/{id}')
  Future<HttpResponse<Speaker>> getSpeakerById({
    @Path() required String id,
  });
}
