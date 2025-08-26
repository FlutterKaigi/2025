import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/internal_api_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:engine/util/json_response.dart';
import 'package:internal_api_client/internal_api_client.dart';
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

      final profileWithSns = await database.profile.getProfileWithSnsLinks(
        user.id,
      );
      if (profileWithSns == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'プロファイルが見つかりません',
        );
      }

      // ネームプレート変更可能かどうかの判定
      final profileCreatedAt = profileWithSns.profile.createdAt;
      // TODO(YumNumm): 日付を設定する
      const nameplateDeadline = '2025-02-01T00:00:00Z';
      final deadline = DateTime.parse(nameplateDeadline);
      final canEditNameplate = profileCreatedAt.isAfter(deadline);

      final response = ProfileResponse(
        profile: profileWithSns.profile,
        snsLinks: profileWithSns.snsLinks,
        canEditNameplate: canEditNameplate,
        nameplateNote: canEditNameplate
            ? null
            : 'このアカウントは$nameplateDeadline以前に作成されたため、ネームプレートに印刷済みの情報は変更できません。',
      );
      return response.toJson();
    },
  );

  @Route.put('/me')
  Future<Response> _updateMyProfile(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final body =
          jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final updateRequest = ProfileUpdateRequest.fromJson(body);
      final database = await container.read(dbClientProvider.future);

      // バリデーション
      if (updateRequest.comment != null &&
          updateRequest.comment!.length > 100) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'コメントは100文字以内で入力してください',
        );
      }

      // プロファイル更新データを作成
      final profileData = ProfileUpdateData(
        name: updateRequest.name,
        comment: updateRequest.comment,
        isAdult: updateRequest.isAdult,
        updatedAt: DateTime.now(),
      );

      // プロファイルを更新
      final updatedProfile = await database.profile.upsertProfile(
        user.id,
        profileData,
      );

      // SNSリンクを更新
      final snsLinksData = updateRequest.snsLinks;
      if (snsLinksData != null) {
        final linksToReplace = snsLinksData
            .map(
              (link) => SnsLinkData(
                snsType: link.snsType,
                value: link.value.trim(),
              ),
            )
            .toList();

        await database.profile.replaceSnsLinks(user.id, linksToReplace);
      }

      return updatedProfile.toJson();
    },
  );

  @Route.delete('/me/avatar')
  Future<Response> _deleteMyAvatar(
    Request request,
  ) async => exceptionHandler(() async {
    final supabaseUtil = container.read(supabaseUtilProvider);
    final userResult = await supabaseUtil.extractUser(request);
    final (_, user, _) = userResult.unwrap;

    final database = await container.read(dbClientProvider.future);

    // 現在のプロファイル情報を取得してアバターURLを確認
    final profileWithSns = await database.profile.getProfileWithSnsLinks(
      user.id,
    );
    if (profileWithSns == null) {
      throw ErrorResponse.errorCode(
        code: ErrorCode.notFound,
        detail: 'プロファイルが見つかりません',
      );
    }

    final profile = profileWithSns.profile;

    // アバターURLからR2のキーを抽出
    if (profile.avatarKey != null && profile.avatarKey!.isNotEmpty) {
      try {
        final avatarKey = profile.avatarKey!;

        final internalApiClient = container.read(internalApiClientProvider);
        // R2からファイルを削除
        final deleteResponse = await internalApiClient.r2InternalApi.r2Api
            .deleteObject(
              request: DeleteObjectRequest(key: avatarKey),
            );

        if (deleteResponse.response.statusCode != 200 ||
            !deleteResponse.data.success) {
          print('R2からのファイル削除に失敗しました: ${deleteResponse.response.statusCode}');
          throw ErrorResponse.errorCode(
            code: ErrorCode.internalServerError,
            detail: 'R2からのファイル削除に失敗しました',
          );
        }

        // データベースからアバター情報を削除
        await database.profile.deleteAvatar(user.id);
      } on Exception catch (e) {
        print('R2からのファイル削除中にエラーが発生しました: $e');
        throw ErrorResponse.errorCode(
          code: ErrorCode.internalServerError,
          detail: 'R2からのファイル削除中にエラーが発生しました',
        );
      }
    }
    return Response(204);
  });

  Router get router => _$ProfileApiServiceRouter(this);
}
