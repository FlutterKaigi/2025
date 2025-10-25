import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';

class StaffMemberDbClient {
  const StaffMemberDbClient({
    required Executor executor,
    required String iconBaseUrl,
  }) : _executor = executor,
       _iconBaseUrl = iconBaseUrl;

  final Executor _executor;
  final String _iconBaseUrl;

  /// スタッフメンバー一覧を取得（SNSリンク含む）
  Future<List<StaffMemberWithSnsLinks>> getStaffMembersWithSnsLinks() async {
    final result = await _executor.execute(
      '''
        SELECT 
          sm.id,
          sm.name,
          sm.icon_name,
          sm.greeting,
          COALESCE(
            jsonb_agg(
              jsonb_build_object(
                'type', sns.sns_type,
                'value', sns.value
              )
            ) FILTER (WHERE sns.id IS NOT NULL),
            '[]'::jsonb
          ) AS sns_links
        FROM 
          staff_members sm
        LEFT JOIN 
          staff_member_sns_links sns ON sm.id = sns.staff_member_id
        GROUP BY 
          sm.id, sm.name, sm.icon_name, sm.greeting
        ORDER BY 
          sm.name
      ''',
    );

    return result.map((e) {
      final json = e.toColumnMapSafe();
      // アイコン名をアイコンURLに変換
      final iconFileName = json['icon_name'] as String;
      json['icon_url'] = '$_iconBaseUrl/staff-members/$iconFileName';
      return StaffMemberWithSnsLinks.fromJson(json);
    }).toList();
  }
}
