import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:supabase/supabase.dart';

/// [fn]を実行し、例外が発生した場合に、適切なHTTPレスポンスを返す関数
Future<Response> exceptionHandler(Future<Response> Function() fn) async {
  try {
    return await fn();
  } on AuthorizationException catch (e) {
    return Response.json(
      statusCode: HttpStatus.unauthorized,
      body: ErrorResponse.errorCode(
        code: ErrorCode.unauthorized,
        detail:
            '認証エラーが発生しました: '
            '[${e.type.name}]: ${e.message ?? ""}',
      ).toJson(),
    );
  } on PostgrestException catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail:
            'データベースとの通信中にエラーが発生しました: '
            '[${e.code}]: ${e.message}',
      ).toJson(),
    );
  } on Exception catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていない例外が発生しました: ${e.runtimeType}',
      ).toJson(),
    );
  }
  // MEMO(@YumNumm): DartをWebAssemblyにトランスパイルし、Exceptionを投げると
  // 稀に`JavaScriptError`が発生します
  // そのため、ここでハンドリングしています。詳しい条件等は調査中です。
  // Note: This is now less relevant for Dart VM, but keeping for compatibility
  // ignore: avoid_catching_errors
  on Error catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていないエラーが発生しました: ${e.runtimeType}',
      ).toJson(),
    );
  }
}
