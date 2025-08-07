import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_client/db_client.dart';
import 'package:dio/dio.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:supabase/supabase.dart';

/// [fn]を実行し、例外が発生した場合に、適切なHTTPレスポンスを返す関数
Future<shelf.Response> exceptionHandler(
  Future<shelf.Response> Function() fn,
) async {
  try {
    try {
      return await fn();
    } catch (e) {
      print(e);
      rethrow;
    }
  } on AuthorizationException catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.unauthorized,
        detail: '認証エラー: $e',
      ).toJson(),
      HttpStatus.unauthorized,
    );
  } on CheckedFromJsonException catch (e) {
    print(e);
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'JSONのデコード中にエラーが発生しました: ${e.className}.${e.key}, ${e.message}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  } on PgException catch (e) {
    return jsonResponse(() async {
      // See: https://www.postgresql.jp/document/16/html/errcodes-appendix.html
      print(e.message);
      return ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'データベース側のエラーが発生しました: ${e.severity} ${e.message}',
      ).toJson();
    }, HttpStatus.internalServerError);
  } on DioException catch (e) {
    print(e.error);
    print(e.requestOptions.uri);
    print(e.response?.data);

    return jsonResponse(() async {
      return ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail:
            '内部APIとの通信でエラーが発生しました: ${e.requestOptions.uri} '
            '${e.response?.data ?? ""}',
      ).toJson();
    }, HttpStatus.internalServerError);
  } on ErrorResponse catch (e) {
    return jsonResponse(() async => e.toJson(), e.code.statusCode);
  } on PostgrestException catch (e) {
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: '${e.runtimeType}',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  } on AuthApiException catch (e) {
    print(e);
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.unauthorized,
        detail: 'Authentication Error: $e',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  } on Exception catch (e) {
    print(e);
    return jsonResponse(
      () async => ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'ハンドルされていない例外が発生しました: ${e.runtimeType} $e',
      ).toJson(),
      HttpStatus.internalServerError,
    );
  }
}
