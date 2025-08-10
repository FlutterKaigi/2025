import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'profile_api_service.g.dart';

class ProfileApiService {
  @Route.get('/me')
  Future<Response> _getMyProfile(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;
      
      final database = await container.read(dbClientProvider.future);
      
      // プロファイル情報とSNSリンクを一回のクエリで取得
      final profileWithSns = await database.from('profiles').select('''
        id,
        name,
        comment,
        is_adult,
        avatar_key,
        created_at,
        updated_at,
        user_sns_links:user_sns_links(
          id,
          sns_type,
          value,
          created_at,
          updated_at
        )
      ''').eq('id', user.id).maybeSingle();
      
      if (profileWithSns == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'プロファイルが見つかりません',
        );
      }
      
      // ネームプレート変更可能かどうかの判定
      // 特定の日付（例：2025年2月1日）以前に作成されたユーザーは変更不可
      final profileCreatedAt = DateTime.parse(profileWithSns['created_at'] as String);
      const nameplateDeadline = '2025-02-01T00:00:00Z';
      final deadline = DateTime.parse(nameplateDeadline);
      final canEditNameplate = profileCreatedAt.isAfter(deadline);
      
      final profile = Profiles.fromJson(profileWithSns);
      final snsLinks = (profileWithSns['user_sns_links'] as List? ?? [])
          .map((link) => UserSnsLinks.fromJson(link as Map<String, dynamic>))
          .toList();
      
      return {
        'profile': profile.toJson(),
        'snsLinks': snsLinks.map((link) => link.toJson()).toList(),
        'canEditNameplate': canEditNameplate,
        'nameplateNote': canEditNameplate 
            ? null 
            : 'このアカウントは$nameplateDeadline以前に作成されたため、ネームプレートに印刷済みの情報は変更できません。',
      };
    },
  );

  @Route.put('/me')
  Future<Response> _updateMyProfile(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;
      
      final body = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final database = await container.read(dbClientProvider.future);
      
      // プロファイル更新
      final profileData = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(),
      };
      
      if (body.containsKey('name')) {
        profileData['name'] = body['name'] as String;
      }
      if (body.containsKey('comment')) {
        final comment = body['comment'] as String;
        if (comment.length > 100) {
          throw ErrorResponse.errorCode(
            code: ErrorCode.badRequest,
            detail: 'コメントは100文字以内で入力してください',
          );
        }
        profileData['comment'] = comment;
      }
      if (body.containsKey('isAdult')) {
        profileData['is_adult'] = body['isAdult'] as bool;
      }
      
      // プロファイルを更新
      final updatedProfile = await database
          .from('profiles')
          .update(profileData)
          .eq('id', user.id)
          .select()
          .single();
      
      // SNSリンクを更新
      if (body.containsKey('snsLinks')) {
        final snsLinksData = body['snsLinks'] as List;
        
        // 既存のSNSリンクを削除
        await database
            .from('user_sns_links')
            .delete()
            .eq('user_id', user.id);
        
        // 新しいSNSリンクを挿入
        if (snsLinksData.isNotEmpty) {
          final linksToInsert = snsLinksData.map((link) => {
            'user_id': user.id,
            'sns_type': link['snsType'] as String,
            'value': (link['value'] as String).trim(),
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          }).toList();
          
          await database.from('user_sns_links').insert(linksToInsert);
        }
      }
      
      return Profiles.fromJson(updatedProfile).toJson();
    },
  );

  @Route.delete('/me/avatar')
  Future<Response> _deleteMyAvatar(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;
      
      final database = await container.read(dbClientProvider.future);
      
      // アバターキーをnullに設定
      await database
          .from('profiles')
          .update({
            'avatar_key': null,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
      
      // TODO: 実際のファイル削除処理を実装
      // R2からファイル削除のロジックをここに追加
      
      return {'success': true, 'message': 'アバターを削除しました'};
    },
  );

  @Route.post('/me/avatar/upload-url')
  Future<Response> _getAvatarUploadUrl(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;
      
      final body = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final fileName = body['fileName'] as String?;
      final contentType = body['contentType'] as String?;
      
      if (fileName == null || contentType == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'ファイル名とコンテンツタイプが必要です',
        );
      }
      
      // TODO: 実際の署名付きURL生成処理を実装
      // R2への署名付きURL生成のロジックをここに追加
      
      // Mockレスポンス
      final avatarKey = 'avatars/${user.id}/${DateTime.now().millisecondsSinceEpoch}_$fileName';
      final uploadUrl = 'https://mock-upload-url.example.com/$avatarKey';
      
      return {
        'uploadUrl': uploadUrl,
        'avatarKey': avatarKey,
        'expiresIn': 3600, // 1時間
      };
    },
  );

  Router get router => _$ProfileApiServiceRouter(this);
}