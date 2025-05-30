import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

/// [fn]を実行し、例外が発生した場合に、適切なHTTPレスポンスを返す関数
Future<Response> exceptionHandler(Future<Response> Function() fn) async {
  try {
    return await fn();
  } on AuthorizationException catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.unauthorized,
        detail:
            '認証エラーが発生しました: '
            '[${e.type.name}]: ${e.message ?? ""}',
      ).toJson(),
      HttpStatus.unauthorized,
    );
  } on PostgrestException catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail:
            'データベースとの通信中にエラーが発生しました: '
            '[${e.code}]: ${e.message}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  } on Exception catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていない例外が発生しました: ${e.runtimeType}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  }
  // MEMO(@YumNumm): DartをWebAssemblyにトランスパイルし、Exceptionを投げると
  // 稀に`JavaScriptError`が発生します
  // そのため、ここでハンドリングしています。詳しい条件等は調査中です。
  // ignore: avoid_catching_errors
  on Error catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていないエラーが発生しました: ${e.runtimeType}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  }
}
