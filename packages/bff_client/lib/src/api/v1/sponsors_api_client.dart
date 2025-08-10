import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sponsors_api_client.g.dart';

@RestApi()
abstract class SponsorsApiClient {
  factory SponsorsApiClient(Dio dio, {String? baseUrl}) = _SponsorsApiClient;

  /// スポンサー情報のサマリーを取得
  @GET('/v1/sponsors')
  Future<SponsorSummary> getSponsors();

  /// 企業スポンサーの詳細情報を取得
  @GET('/v1/sponsors/companies')
  Future<Map<String, List<CompanySponsorDetail>>> getCompanySponsors();

  /// 個人スポンサーの詳細情報を取得
  @GET('/v1/sponsors/individuals')
  Future<Map<String, List<IndividualSponsorDetail>>> getIndividualSponsors();
}
