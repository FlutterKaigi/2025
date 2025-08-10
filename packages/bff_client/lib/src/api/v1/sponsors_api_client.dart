import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';

class SponsorsApiClient {
  const SponsorsApiClient(Dio client) : _client = client;

  final Dio _client;

  /// スポンサー情報のサマリーを取得
  Future<SponsorSummary> getSponsors() async {
    final response = await _client.get('/v1/sponsors');

    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      return SponsorSummary.fromJson(json);
    } else {
      throw Exception('Failed to fetch sponsors: ${response.statusCode}');
    }
  }

  /// 企業スポンサーの詳細情報を取得
  Future<List<CompanySponsorDetail>> getCompanySponsors() async {
    final response = await _client.get('/v1/sponsors/companies');

    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      final sponsorsList = json['sponsors'] as List<dynamic>;
      return sponsorsList
          .map((s) => CompanySponsorDetail.fromJson(s as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch company sponsors: ${response.statusCode}',
      );
    }
  }

  /// 個人スポンサーの詳細情報を取得
  Future<List<IndividualSponsorDetail>> getIndividualSponsors() async {
    final response = await _client.get('/v1/sponsors/individuals');

    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      final sponsorsList = json['sponsors'] as List<dynamic>;
      return sponsorsList
          .map(
            (s) => IndividualSponsorDetail.fromJson(s as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception(
        'Failed to fetch individual sponsors: ${response.statusCode}',
      );
    }
  }
}
