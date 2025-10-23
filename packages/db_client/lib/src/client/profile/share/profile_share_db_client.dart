import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class ProfileShareDbClient {
  ProfileShareDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  Future<List<ProfileWithSnsLinks>> getSharedProfiles({
    required String userId,
  }) async {
    final result = await _executor.execute(
      '''
        SELECT
          json_build_object(
            'id', p.id,
            'name', p.name,
            'comment', p.comment,
            'is_adult', p.is_adult,
            'avatar_key', p.avatar_key,
            'created_at', p.created_at,
            'updated_at', p.updated_at
          ) AS profile,
          COALESCE(
            json_agg(
              json_build_object(
                'id', usl.id,
                'user_id', usl.user_id,
                'sns_type', usl.sns_type,
                'value', usl.value,
                'created_at', usl.created_at,
                'updated_at', usl.updated_at
              ) ORDER BY usl.created_at
            ) FILTER (WHERE usl.id IS NOT NULL),
            '[]'::json
          ) AS sns_links,
          au.raw_user_meta_data->>'avatar_url' AS avatar_url
        FROM profile_share ps
        INNER JOIN profiles p ON ps.from_id = p.id
        INNER JOIN auth.users au on p.id = au.id
        LEFT JOIN user_sns_links usl ON p.id = usl.user_id
        WHERE ps.to_id = @user_id
        GROUP BY p.id, au.raw_user_meta_data->>'avatar_url'
      ''',
      parameters: {'user_id': userId},
    );

    return result.map((row) {
      final rowData = row.toColumnMap();
      return ProfileWithSnsLinks.fromJson(rowData);
    }).toList();
  }

  Future<int> getTotalSharedProfilesCount() async {
    final result = await _executor.execute(
      '''
        SELECT COUNT(*) AS count
        FROM profile_share
      ''',
    );
    final map = result.firstOrNull?.toColumnMap();
    final count = map?['count'];
    if (count == null || count is! int) {
      throw Exception('Count is null');
    }
    return count ~/ 2;
  }
}
