import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_client/db_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

/// [fn]を実行し、例外が発生した場合に、適切なHTTPレスポンスを返す関数
Future<Response> exceptionHandler(Future<Response> Function() fn) async {
  try {
    return await fn();
  } on AuthorizationException catch (e) {
    return Response(
      HttpStatus.unauthorized,
      body: jsonEncode(
        ErrorResponse.errorCode(
          code: ErrorCode.unauthorized,
          detail:
              '認証エラーが発生しました: '
              '[${e.type.name}]: ${e.message ?? ""}',
        ).toJson(),
      ),
      headers: {'Content-Type': 'application/json'},
    );
  } on CheckedFromJsonException catch (e) {
    return jsonResponse(
      () async =>
          ErrorResponse.errorCode(
            code: ErrorCode.internalServerError,
            detail: 'JSONのデコード中にエラーが発生しました: ${e.key}, ${e.message}',
          ).toJson(),
      HttpStatus.internalServerError,
    );
  } on PgResultError catch (e) {
    print('error: ${e.error}');
    return jsonResponse(() async {
      // See: https://www.postgresql.jp/document/16/html/errcodes-appendix.html
      final postgresErrorCode = e.error['code'] ?? '';
      return ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'データベースとの通信中にエラーが発生しました: $postgresErrorCode',
      ).toJson();
    }, HttpStatus.internalServerError);
  } on ErrorResponse catch (e) {
    return jsonResponse(() async => e.toJson(), e.code.statusCode);
  } on PostgrestException catch (e) {
    return Response(
      HttpStatus.internalServerError,
      body: jsonEncode(
        ErrorResponse.errorCode(
          code: ErrorCode.internalServerError,
          detail:
              'データベースとの通信中にエラーが発生しました: '
              '[${e.code}]: ${e.message}',
        ).toJson(),
      ),
      headers: {'Content-Type': 'application/json'},
    );
  } on Exception catch (e) {
    print(e);
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていない例外が発生しました: ${e.runtimeType}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  }
}
