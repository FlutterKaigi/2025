import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class SponsorDbClient {
  const SponsorDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// 企業スポンサーの詳細情報を取得
  Future<List<CompanySponsorDetail>> getCompanySponsors() async {
    const query = '''
      SELECT 
        c.id,
        c.name,
        c.logo_name,
        sc.sponsor_type,
        bsc.basic_plan_type,
        ARRAY_AGG(sco.option_plan_type) FILTER (WHERE sco.option_plan_type IS NOT NULL) as option_plan_types,
        sc.created_at
      FROM companies c
      INNER JOIN sponsor_companies sc ON c.id = sc.company_id
      LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
      LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
      GROUP BY c.id, c.name, c.logo_name, sc.sponsor_type, bsc.basic_plan_type, sc.created_at
      ORDER BY 
        CASE bsc.basic_plan_type
          WHEN 'platinum' THEN 1
          WHEN 'gold' THEN 2
          WHEN 'silver' THEN 3
          WHEN 'bronze' THEN 4
          ELSE 5
        END,
        c.name
    ''';

    final results = await _connection.execute(query);
    final sponsors = <CompanySponsorDetail>[];

    for (final row in results) {
      final optionPlanTypes = <OptionPlanType>[];
      if (row[5] != null) {
        final optionTypes = row[5] as List<dynamic>;
        for (final optionType in optionTypes) {
          switch (optionType as String) {
            case 'naming_rights_hall':
              optionPlanTypes.add(OptionPlanType.namingRightsHall);
            case 'naming_rights_room':
              optionPlanTypes.add(OptionPlanType.namingRightsRoom);
            case 'nameplate':
              optionPlanTypes.add(OptionPlanType.nameplate);
            case 'lunch':
              optionPlanTypes.add(OptionPlanType.lunch);
            case 'scholarship':
              optionPlanTypes.add(OptionPlanType.scholarship);
          }
        }
      }

      BasicPlanType? basicPlanType;
      if (row[4] != null) {
        switch (row[4] as String) {
          case 'platinum':
            basicPlanType = BasicPlanType.platinum;
          case 'gold':
            basicPlanType = BasicPlanType.gold;
          case 'silver':
            basicPlanType = BasicPlanType.silver;
          case 'bronze':
            basicPlanType = BasicPlanType.bronze;
        }
      }

      CompanySponsorType sponsorType;
      switch (row[3] as String) {
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

      sponsors.add(
        CompanySponsorDetail(
          id: row[0] as int,
          name: row[1] as String,
          logoName: row[2] as String,
          sponsorType: sponsorType,
          basicPlanType: basicPlanType,
          optionPlanTypes: optionPlanTypes.isNotEmpty ? optionPlanTypes : null,
          createdAt: row[6] as DateTime,
        ),
      );
    }

    return sponsors;
  }

  /// 個人スポンサーの詳細情報を取得
  Future<List<IndividualSponsorDetail>> getIndividualSponsors() async {
    const query = '''
      SELECT 
        i.id,
        u.raw_user_meta_data->>'name' as user_name,
        si.created_at
      FROM individuals i
      INNER JOIN sponsor_individuals si ON i.id = si.individual_id
      INNER JOIN users u ON i.user_id = u.id
      ORDER BY si.created_at DESC
    ''';

    final results = await _connection.execute(query);
    final sponsors = <IndividualSponsorDetail>[];

    for (final row in results) {
      sponsors.add(
        IndividualSponsorDetail(
          id: row[0] as int,
          userName: row[1] as String?,
          createdAt: row[2] as DateTime,
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
