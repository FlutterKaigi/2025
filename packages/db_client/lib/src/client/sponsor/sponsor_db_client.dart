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
          sc.sponsor_type,
          bsc.basic_plan_type,
          sc.created_at
        FROM companies c
        INNER JOIN sponsor_companies sc ON c.id = sc.company_id
        LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
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

    final sponsors = <CompanySponsorDetail>[];
    for (final row in result) {
      final rowMap = row.toColumnMap();

      // PostgreSQL enum型の値を適切に処理
      final sponsorTypeValue = rowMap['sponsor_type'];
      String sponsorTypeStr;
      if (sponsorTypeValue is String) {
        sponsorTypeStr = sponsorTypeValue;
      } else if (sponsorTypeValue is UndecodedBytes) {
        sponsorTypeStr = sponsorTypeValue.asString;
      } else {
        sponsorTypeStr = sponsorTypeValue.toString();
      }

      CompanySponsorType sponsorType;
      switch (sponsorTypeStr) {
        case 'basic':
          sponsorType = CompanySponsorType.basic;
        case 'community':
          sponsorType = CompanySponsorType.community;
        case 'tool':
          sponsorType = CompanySponsorType.tool;
        case 'none':
          sponsorType = CompanySponsorType.none;
        default:
          sponsorType = CompanySponsorType.none;
      }

      BasicPlanType? basicPlanType;
      final basicPlanTypeValue = rowMap['basic_plan_type'];
      if (basicPlanTypeValue != null) {
        String basicPlanTypeStr;
        if (basicPlanTypeValue is String) {
          basicPlanTypeStr = basicPlanTypeValue;
        } else if (basicPlanTypeValue is UndecodedBytes) {
          basicPlanTypeStr = basicPlanTypeValue.asString;
        } else {
          basicPlanTypeStr = basicPlanTypeValue.toString();
        }

        switch (basicPlanTypeStr) {
          case 'platinum':
            basicPlanType = BasicPlanType.platinum;
          case 'gold':
            basicPlanType = BasicPlanType.gold;
          case 'silver':
            basicPlanType = BasicPlanType.silver;
          case 'bronze':
            basicPlanType = BasicPlanType.bronze;
          default:
            basicPlanType = BasicPlanType.bronze;
        }
      }

      sponsors.add(
        CompanySponsorDetail(
          id: rowMap['id'] as int,
          name: rowMap['name'] as String,
          logoName: rowMap['logo_name'] as String,
          sponsorType: sponsorType,
          basicPlanType: basicPlanType,
          createdAt: rowMap['created_at'] as DateTime,
        ),
      );
    }

    return sponsors;
  }

  /// 個人スポンサーの詳細情報を取得
  Future<List<IndividualSponsorDetail>> getIndividualSponsors() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT 
          i.id,
          au.raw_user_meta_data->>'name' as user_name,
          si.created_at
        FROM individuals i
        INNER JOIN sponsor_individuals si ON i.id = si.individual_id
        INNER JOIN auth.users au ON i.user_id = au.id
        ORDER BY si.created_at DESC
      '''),
    );

    final sponsors = <IndividualSponsorDetail>[];
    for (final row in result) {
      final rowMap = row.toColumnMap();

      sponsors.add(
        IndividualSponsorDetail(
          id: rowMap['id'] as int,
          userName: rowMap['user_name'] as String?,
          createdAt: rowMap['created_at'] as DateTime,
        ),
      );
    }

    return sponsors;
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
