import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/model/files/file_object_key.dart';
import 'package:engine/provider/internal_api_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:internal_api_client/internal_api_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

part 'files_api_service.g.dart';

class FilesApiService {
  @Route.post('/upload')
  Future<Response> _uploadFile(Request request) async => jsonResponse(() async {
    final supabaseUtil = container.read(supabaseUtilProvider);
    final userResult = await supabaseUtil.extractUser(request);
    final (_, user, _) = userResult.unwrap;

    final body =
        jsonDecode(await request.readAsString()) as Map<String, dynamic>;
    final uploadRequest = FilesUploadRequest.fromJson(body);

    // ファイルの拡張子とMIMEタイプを決定（アバターの場合はJPEG/PNG/WEBPを想定）
    const extension = 'webp';
    const mimeType = 'image/webp';
    final contentLength = uploadRequest.contentLength;
    const expiresIn = 60 * 5; // 5m

    const maxContentLength = 5 * 1024 * 1024; // 5MB
    if (contentLength > maxContentLength) {
      throw ErrorResponse.errorCode(
        code: ErrorCode.badRequest,
        detail: 'ファイルサイズが5MBを超えています',
      );
    }

    final uuid = const Uuid().v7();
    final key = FileObjectKey.avatar(
      userId: user.id,
      uuid: uuid,
      extension: extension,
    );

    try {
      // R2 Internal APIを呼び出して署名付きURLを取得
      final internalApiClient = container.read(internalApiClientProvider);
      final response = await internalApiClient.r2InternalApi.r2Api
          .createSignedUrl(
            request: CreateSignedUrlRequest(
              key: key.toString(),
              extension: extension,
              contentLength: contentLength,
              mimeType: mimeType,
              expiresIn: expiresIn,
            ),
          );

      if (response.response.statusCode != 200) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.internalServerError,
          detail: 'ファイルアップロード用URLの生成に失敗しました',
        );
      }

      final signedUrlData = response.data;
      return FilesUploadResponse(
        url: signedUrlData.signedUrl,
        key: signedUrlData.key,
      ).toJson();
    } catch (e) {
      if (e is ErrorResponse) {
        rethrow;
      }
      throw ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ファイルアップロード用URLの生成中にエラーが発生しました: $e',
      );
    }
  });

  Router get router => _$FilesApiServiceRouter(this);
}
