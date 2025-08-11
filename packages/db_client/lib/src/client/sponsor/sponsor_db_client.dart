import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class SponsorDbClient {
  const SponsorDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// 企業スポンサーの詳細情報を取得
  Future<List<CompanySponsorDetail>> getCompanySponsors() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT 
          c.id,
          c.name,
          c.logo_name,
          cd.slug,
          cd.description,
          cd.website_url,
          sc.sponsor_type,
          bsc.basic_plan_type
        FROM companies c
        INNER JOIN sponsor_companies sc ON c.id = sc.company_id
        LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
        LEFT JOIN company_drafts cd ON c.id = cd.company_id
        LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
        WHERE cda.id IS NOT NULL
          AND cd.slug IS NOT NULL
          AND cd.description IS NOT NULL
          AND cd.website_url IS NOT NULL
        ORDER BY 
          CASE bsc.basic_plan_type
            WHEN 'platinum' THEN 1
            WHEN 'gold' THEN 2
            WHEN 'silver' THEN 3
            WHEN 'bronze' THEN 4
            ELSE 5
          END,
          c.name
      '''),
    );

    return result
        .map((e) => CompanySponsorDetail.fromJson(e.toColumnMapSafe()))
        .toList();
  }

  /// 個人スポンサーの詳細情報を取得
  Future<List<IndividualSponsorDetail>> getIndividualSponsors() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT 
          i.id,
          COALESCE(id.name, au.raw_user_meta_data->>'name') as name,
          id.slug,
          id.logo_name
        FROM individuals i
        INNER JOIN sponsor_individuals si ON i.id = si.individual_id
        INNER JOIN auth.users au ON i.user_id = au.id
        LEFT JOIN individual_drafts id ON i.id = id.individual_id
        LEFT JOIN individual_draft_approvals ida ON id.id = ida.individual_draft_id
        WHERE ida.id IS NOT NULL
          AND id.slug IS NOT NULL
          AND id.logo_name IS NOT NULL
        ORDER BY id.created_at DESC
      '''),
    );

    return result
        .map((e) => IndividualSponsorDetail.fromJson(e.toColumnMapSafe()))
        .toList();
  }

  /// スポンサー情報のサマリーを取得
  Future<SponsorSummary> getSponsorSummary() async {
    final companySponsors = await getCompanySponsors();
    final individualSponsors = await getIndividualSponsors();

    return SponsorSummary(
      companySponsors: companySponsors,
      individualSponsors: individualSponsors,
    );
  }
}
