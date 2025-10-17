import 'dart:convert';

import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/client/profile/share/profile_share_db_client.dart';
import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class ProfileDbClient {
  ProfileDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  ProfileShareDbClient get share => ProfileShareDbClient(executor: _executor);

  /// プロファイル情報とSNSリンクを取得
  Future<ProfileWithSnsLinks?> getProfileWithSnsLinks(String userId) async {
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
          ) AS sns_links
        FROM profiles p
        LEFT JOIN user_sns_links usl ON p.id = usl.user_id
        WHERE p.id = @user_id
        GROUP BY p.id, p.name, p.comment, p.is_adult, p.avatar_key, p.created_at, p.updated_at
      ''',
      parameters: {'user_id': userId},
    );

    final rowData = result.firstOrNull?.toColumnMap();
    if (rowData == null) {
      return null;
    }

    return ProfileWithSnsLinks.fromJson(rowData);
  }

  /// プロファイルを更新
  Future<Profiles> upsertProfile(
    String userId,
    ProfileUpdateData profileData,
  ) async {
    final result = await _executor.execute(
      '''
        INSERT INTO profiles (id, name, comment, is_adult, avatar_key)
        VALUES (@user_id, @name, @comment, @is_adult, @avatar_key)
        ON CONFLICT (id) DO UPDATE SET
          name = @name,
          comment = @comment,
          is_adult = @is_adult,
          avatar_key = @avatar_key,
          updated_at = @updated_at
        RETURNING *
      ''',
      parameters: {
        'user_id': userId,
        'name': profileData.name,
        'comment': profileData.comment,
        'is_adult': profileData.isAdult,
        'avatar_key': profileData.avatarKey,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );

    final updatedProfileData = result.firstOrNull?.toColumnMap();
    if (updatedProfileData == null) {
      throw PgException('Profile update failed');
    }
    final updatedProfile = Profiles.fromJson(updatedProfileData);
    return updatedProfile;
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
            'type': link.snsType.name,
            'value': link.value,
          },
        )
        .toList();

    await _executor.execute(
      'SELECT public.replace_user_sns_links(@user_id, @sns_accounts::jsonb)',
      parameters: {
        'user_id': userId,
        'sns_accounts': jsonEncode(snsAccountsJson),
      },
    );
  }

  /// アバターキーを削除
  Future<void> deleteAvatar(String userId) async {
    await _executor.execute(
      '''
        UPDATE profiles
        SET avatar_key = NULL, updated_at = @updated_at
        WHERE id = @user_id
      ''',
      parameters: {
        'user_id': userId,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );
  }
}
