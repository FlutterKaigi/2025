import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class ProfileDbClient {
  ProfileDbClient({required Connection connection}) : _connection = connection;

  final Connection _connection;

  /// プロファイル情報とSNSリンクを取得
  Future<ProfileWithSnsLinks?> getProfileWithSnsLinks(String userId) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT
          p.id,
          p.name,
          p.comment,
          p.is_adult,
          p.avatar_key,
          p.created_at,
          p.updated_at,
          COALESCE(
            json_agg(
              json_build_object(
                'id', usl.id,
                'sns_type', usl.sns_type,
                'value', usl.value,
                'created_at', usl.created_at,
                'updated_at', usl.updated_at
              ) ORDER BY usl.created_at
            ) FILTER (WHERE usl.id IS NOT NULL),
            '[]'::json
          ) AS user_sns_links
        FROM profiles p
        LEFT JOIN user_sns_links usl ON p.id = usl.user_id
        WHERE p.id = @user_id
        GROUP BY p.id, p.name, p.comment, p.is_adult, p.avatar_key, p.created_at, p.updated_at
      '''),
      parameters: {'user_id': userId},
    );

    final profileData = result.firstOrNull?.toColumnMap();
    if (profileData == null) {
      return null;
    }

    final profile = Profiles.fromJson({
      'id': profileData['id'] as String,
      'name': profileData['name'] as String,
      'comment': profileData['comment'] as String,
      'isAdult': profileData['is_adult'] as bool,
      'avatarKey': profileData['avatar_key'] as String?,
      'createdAt': profileData['created_at'] as String,
      'updatedAt': profileData['updated_at'] as String,
    });

    final snsLinksJson = profileData['user_sns_links'] as List;
    final snsLinks = snsLinksJson.map(
      (link) {
        final linkMap = link as Map<String, dynamic>;
        return UserSnsLinks.fromJson({
          'id': linkMap['id'] as String,
          'userId': userId,
          'snsType': linkMap['sns_type'] as String,
          'value': linkMap['value'] as String,
          'createdAt': linkMap['created_at'] as String,
          'updatedAt': linkMap['updated_at'] as String,
        });
      },
    ).toList();

    return ProfileWithSnsLinks(
      profile: profile,
      snsLinks: snsLinks,
    );
  }

  /// プロファイルを更新
  Future<Profiles> updateProfile(
    String userId,
    ProfileUpdateData profileData,
  ) async {
    final fields = <String>[];
    final parameters = <String, dynamic>{'user_id': userId};
    final dataMap = profileData.toJson();

    for (final entry in dataMap.entries) {
      if (entry.value != null && entry.key != 'user_id') {
        fields.add('${entry.key} = @${entry.key}');
        parameters[entry.key] = entry.value;
      }
    }

    final result = await _connection.execute(
      Sql.named('''
        UPDATE profiles
        SET ${fields.join(', ')}
        WHERE id = @user_id
        RETURNING *
      '''),
      parameters: parameters,
    );

    final updatedProfileData = result.firstOrNull?.toColumnMap();
    if (updatedProfileData == null) {
      throw PgException('Profile update failed');
    }

    return Profiles.fromJson({
      'id': updatedProfileData['id'] as String,
      'name': updatedProfileData['name'] as String,
      'comment': updatedProfileData['comment'] as String,
      'isAdult': updatedProfileData['is_adult'] as bool,
      'avatarKey': updatedProfileData['avatar_key'] as String?,
      'createdAt': updatedProfileData['created_at'] as String,
      'updatedAt': updatedProfileData['updated_at'] as String,
    });
  }

  /// SNSリンクを置き換える（PostgreSQL関数を使用）
  Future<void> replaceSnsLinks(
    String userId,
    List<SnsLinkData> snsLinks,
  ) async {
    // SNSアカウント情報をJSONB形式に変換
    final snsAccountsJson = snsLinks
        .map(
          (link) => {
            'type': link.snsType,
            'value': link.value,
          },
        )
        .toList();

    await _connection.execute(
      Sql.named(
        'SELECT public.replace_user_sns_links(@user_id, @sns_accounts)',
      ),
      parameters: {
        'user_id': userId,
        'sns_accounts': snsAccountsJson,
      },
    );
  }

  /// アバターキーを削除
  Future<void> deleteAvatar(String userId) async {
    await _connection.execute(
      Sql.named('''
        UPDATE profiles
        SET avatar_key = NULL, updated_at = @updated_at
        WHERE id = @user_id
      '''),
      parameters: {
        'user_id': userId,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );
  }
}
